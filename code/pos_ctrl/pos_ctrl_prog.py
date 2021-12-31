#
# Positive control testing using progenitor genes for each blood cell type
#
# Use a set of progenitor genes for each kind of blood cell type to see if it
# has a higher prediction accuracy for that cell type than other cell types
# using logistic regression with the same parameters used by Weinreb (2020)
#

# ---- LIBRARIES ----

import numpy as np
import pandas as pd
from sklearn.preprocessing import LabelBinarizer
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from tqdm import tqdm
import os

os.chdir(os.path.dirname(os.path.abspath(__file__)))


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

input_dir = os.fsencode('./../../data/input/pos_ctrl/pos_ctrl_progenitor_signature_genes/')

for input_file in os.listdir(input_dir):
    filename = os.fsdecode(input_file)
    sign_gene = pd.read_csv(filename, sep = "\t")

    data_matrix = np.loadtxt('./../../data/output/neg_control/rand_genes_neg_ctrl_data_all_cell_types.txt')
    feature_array = np.genfromtxt('./../../data/output/neg_control/rand_genes_neg_ctrl_feature_all_cell_types.txt', dtype = 'str')

    df = pd.DataFrame(data_matrix)

    # One-hot encoding of feature_array
    lb = LabelBinarizer()
    lb.fit(feature_array)
    feature_one_hot = lb.transform(feature_array)

    # To recover labels from one hot encoding
    # lb.inverse_transform(feature_one_hot)


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

# Results for 6 cell types with max_iter = 500 (xx failures to converge):

# Results for 6 cell types with max_iter = 1,000:

# Results for all cell types with random 1,000 genes:
# Average accuracy: 0.559
# Standard deviation: 0.026