#
# Cux1 binding targets in CD34 as determined by Jeff Kurkewich
#
# Use the Cux1 binding targets in CD34 as the list of genes to use as the
# dataset for our models (both linear regression & dnn).
#

# Exp_Cux1_binding_targets_CD34_Jeff_Cut_Run_clean_version.txt


# ---- LIBRARIES ----

import numpy as np
import pandas as pd
import fitting

# ---- MODEL ----
def fit_model_filter_genes(model,
                           genes_of_interest_files,
                           genes_of_interest_column_names,
                           genes_of_interest_column_seps,
                           data_matrix_file,
                           data_matrix_column_sep,
                           features_array_file):
    genes_of_interest_multi_array = []

    # List of transcriptor factors
    for i in range(len(genes_of_interest_files)):
        print(genes_of_interest_files[i])
        genes_of_interest_df = pd.read_csv(genes_of_interest_files[i],
                                           sep = genes_of_interest_column_seps[i])
        genes_of_interest_multi_array.append(genes_of_interest_df[genes_of_interest_column_names[i]].tolist())
    print("After loop 1")

    for i in range(len(genes_of_interest_multi_array)):
        print(i)
        genes_of_interest_multi_array[0] = [val for val in genes_of_interest_multi_array[0] if val in genes_of_interest_multi_array[i]]
    print("After loop 2")

    genes_of_interest = genes_of_interest_multi_array[0]

    data_matrix = pd.read_csv(data_matrix_file, sep = data_matrix_column_sep)
    features_array = np.genfromtxt(features_array_file, dtype = 'str')

    # Keep only genes that are genes of interest
    df = data_matrix[data_matrix.columns[data_matrix.columns.isin(genes_of_interest)]]

    accuracy_array = fitting.fit_model(df, features_array, model, 50)

    print(accuracy_array)
    print("\nAverage accuracy: {}".format(np.mean(accuracy_array)))
    print("Standard deviation: {}".format(np.std(accuracy_array)))