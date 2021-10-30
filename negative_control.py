#
# Negative control testing using logistic regression.
#
# Use 50 random pools of 1,000 genes each and apply logistic regression to it
# using the same parameters used by Weinreb (2020)
#

# Should get ~40% prediction accuracy

# ---- LIBRARIES ----

import numpy as np
import pandas as pd
from sklearn.preprocessing import LabelBinarizer
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from tqdm import tqdm


# ---- MODEL ----

# Construct the model using the same parameters as Weinreb (2020). Some
# parameters had to be changed: solver, multi_class, & max_iter.
lr = LogisticRegression(penalty = 'l2',
                        dual = False,
                        tol = 0.0001,
                        # C = [0.008 in vitro; 0.004 in vivo]
                        C = 0.008,
                        fit_intercept = True,
                        intercept_scaling = 1,
                        class_weight = None,
                        random_state = None,
                        # solver = 'warn',
                        solver = 'saga',
                        # max_iter = 100,
                        max_iter = 1000,
                        # multi_class = 'warn',
                        multi_class = 'multinomial',
                        verbose = 0,
                        warm_start = False,
                        n_jobs = None)


# ---- IMPORT DATA ----

data_matrix = np.loadtxt('./data/output/neg_control/rand_genes_neg_ctrl_data_all_cell_types.txt')
feature_array = np.genfromtxt('./data/output/neg_control/rand_genes_neg_ctrl_feature_all_cell_types.txt',
                              dtype = 'str')

df = pd.DataFrame(data_matrix)

# One-hot encoding of feature_array
lb = LabelBinarizer()
lb.fit(feature_array)
feature_one_hot = lb.transform(feature_array)

# To recover labels from one hot encoding
# lb.inverse_transform(feature_one_hot)

print("Total number of genes from which to poll: {}".format(len(data_matrix[0])))


# ---- MODEL & SCORING ----

accuracy_array = []

# Create 50 models of 1000 random genes each and calculate each model's accuracy
for i in tqdm(range(1, 50)):
    df_sample = df.sample(n = 1000,
                          replace = False,
                          axis = 1)

    x_train, x_test, y_train, y_test = train_test_split(df_sample,
                                                        feature_array,
                                                        test_size=0.25,
                                                        random_state=0)

    # Fit the model to the data
    model = lr.fit(x_train, y_train)

    # Score the model accuracy
    accuracy_array.append(model.score(x_test, y_test))


# ---- OUTPUT ----

print(accuracy_array)
print("\nAverage accuracy: {}".format(np.mean(accuracy_array)))
print("Standard deviation: {}".format(np.std(accuracy_array)))

# Results for 3 cell types:
# Average accuracy: 0.633
# Standard deviation: 0.032

# Results for 6 cell types with max_iter = 500 (11 failures to converge):
# Average accuracy: 0.562
# Standard deviation: 0.030

# Results for 6 cell types with max_iter = 1,000:
# Average accuracy: 0.566
# Standard deviation: 0.030

# Results for all cell types with max_iter = 1,000:
# Average accuracy: 0.498
# Standard deviation: 0.026