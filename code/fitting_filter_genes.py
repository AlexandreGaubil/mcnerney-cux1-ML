#
# Cux1 binding targets in CD34 as determined by Jeff Kurkewich
#
# Use the Cux1 binding targets in CD34 as the list of genes to use as the
# dataset for our models (both linear regression & dnn).
#


# ---- LIBRARIES ----

import numpy as np
import pandas as pd
import fitting
from itertools import chain

# ---- MODEL ----
def fit_model_filter_genes(model,
                           genes_of_interest_files,
                           data_matrix_file,
                           data_matrix_column_sep,
                           features_array_file,
                           n_models = 50,
                           hyper_param_tuning = False):
    goi_multi_array = []

    # List of transcriptor factors
    for i in range(len(genes_of_interest_files)):
        genes_of_interest_np = np.genfromtxt(genes_of_interest_files[i], dtype = 'str')
        goi_multi_array.append(genes_of_interest_np)

    for i in range(len(goi_multi_array)):
        goi_multi_array[0] = [val for val in goi_multi_array[0] if val in goi_multi_array[i]]

    genes_of_interest = goi_multi_array[0]

    data_matrix = pd.read_csv(data_matrix_file, sep = data_matrix_column_sep)
    features_array = np.genfromtxt(features_array_file, dtype = 'str')

    # Keep only genes that are genes of interest
    df = data_matrix[data_matrix.columns[data_matrix.columns.isin(genes_of_interest)]]

    accuracy_matrix = []

    for _ in (range(1, 10)):
        df_sample = df.sample(n = 1000,
                                   replace = False,
                                   axis = 1)

        accuracy_matrix.append(fitting.fit_model(df_sample, features_array, model, n_models))

    accuracy_array = list(chain.from_iterable(accuracy_matrix))

    if not hyper_param_tuning:
        print(accuracy_array)
        print("\nAverage accuracy: {}".format(np.mean(accuracy_array)))
        print("Standard deviation: {}".format(np.std(accuracy_array)))
    else:
       print(model.cv_results_)
       print(model.best_estimator_)
       print(model.best_params_)