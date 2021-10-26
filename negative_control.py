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
                        max_iter = 500,
                        # multi_class = 'warn',
                        multi_class = 'auto',
                        verbose = 0,
                        warm_start = False,
                        n_jobs = None)


# ---- IMPORT DATA ----

data_matrix = np.loadtxt('./data/ML_classifier/input_data/rand_genes_neg_ctrl_data.txt')
feature_array = np.genfromtxt('./data/ML_classifier/input_data/rand_genes_neg_ctrl_feature.txt',
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
print("\n")
for i in range(1, 50):
    print("Iteration {}".format(i))
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

# Results: Average accuracy: 0.633, Standard deviation: 0.032