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
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report
# from tqdm import tqdm
import os, sys
sys.path.insert(1, os.path.join(sys.path[0], '..'))
import models, fitting

os.chdir(os.path.dirname(os.path.abspath(__file__)))

print('POS CTRL PROGENITOR CELL\n\n\n')

# ---- IMPORT DATA ----
for model in [models.log_reg, models.neural_network]:
    input_dir_str = './../../data/input/pos_ctrl/pos_ctrl_progenitor_signature_genes/'
    input_dir = os.fsencode(input_dir_str)

    for input_file in os.listdir(input_dir):
        filename = os.fsdecode(input_file)
        if filename.endswith('.csv'):
            print(model)
            print(filename)
            sign_gene_df = pd.read_csv(os.path.join(input_dir_str, filename))
            sign_genes = sign_gene_df['Symbol'].tolist()

            data_matrix = pd.read_csv('./../../data/output/export_script/all_cells_all_genes_data_headers.txt', sep = ' ')
            feature_array = np.genfromtxt('./../../data/output/export_script/all_cells_all_genes_features.txt', dtype = 'str')

            # Keep only genes that are signature genes
            df = data_matrix[data_matrix.columns[data_matrix.columns.isin(sign_genes)]]

            # ---- MODEL & SCORING ----
            accuracy_array = []

            # Create 5 models and calculate each model's accuracy
            for i in range(1, 50):
                x_train, x_test, y_train, y_test = train_test_split(df,
                                                                    feature_array,
                                                                    test_size=0.25)

                # Fit the model to the data
                model_l = model.fit(x_train, y_train)

                # Score the model accuracy
                accuracy_array.append(model_l.score(x_test, y_test))

                y_pred = model_l.predict(x_test)
                print(classification_report(y_test, y_pred))


            # ---- OUTPUT ----
            print("Average accuracy: {}".format(np.mean(accuracy_array)))
            print("Standard deviation: {}".format(np.std(accuracy_array)))
            print('\n\n')

# Results: see `pos_ctrl_prog_result.txt`