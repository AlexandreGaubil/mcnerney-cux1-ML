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
from sklearn.metrics import classification_report
# from tqdm import tqdm
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

input_dir_str = './../../data/input/pos_ctrl/pos_ctrl_progenitor_signature_genes/'
input_dir = os.fsencode(input_dir_str)

for input_file in os.listdir(input_dir):
    filename = os.fsdecode(input_file)
    if filename.endswith('.csv'):
        print(filename)
        sign_gene_df = pd.read_csv(os.path.join(input_dir_str, filename))
        sign_genes = sign_gene_df['Symbol'].tolist()

        data_matrix = pd.read_csv('./../../data/output/export_script/all_cells_all_genes_data_headers.txt', sep = ' ')
        feature_array = np.genfromtxt('./../../data/output/export_script/all_cells_all_genes_features.txt', dtype = 'str')

        # Keep only genes that are signature genes
        df = data_matrix[data_matrix.columns[data_matrix.columns.isin(sign_genes)]]

        # One-hot encoding of feature_array
        lb = LabelBinarizer()
        lb.fit(feature_array)
        feature_one_hot = lb.transform(feature_array)

        # To recover labels from one hot encoding
        # lb.inverse_transform(feature_one_hot)


        # ---- MODEL & SCORING ----

        accuracy_array = []

        # Create 5 models and calculate each model's accuracy
        for i in range(1, 5):
            x_train, x_test, y_train, y_test = train_test_split(df,
                                                                feature_array,
                                                                test_size=0.25)

            # Fit the model to the data
            model = lr.fit(x_train, y_train)

            # Score the model accuracy
            accuracy_array.append(model.score(x_test, y_test))

            y_pred = model.predict(x_test)
            print(classification_report(y_test, y_pred))


        # ---- OUTPUT ----

        print(accuracy_array)
        print("\nAverage accuracy: {}".format(np.mean(accuracy_array)))
        print("Standard deviation: {}".format(np.std(accuracy_array)))

# Results: see `pos_ctrl_prog_result.txt`