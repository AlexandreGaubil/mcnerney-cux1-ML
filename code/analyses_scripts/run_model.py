import numpy as np
import pandas as pd
from itertools import chain
from sklearn.neural_network import MLPClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report
from sklearn.metrics import f1_score as sklearn_f1_score
from sklearn.exceptions import ConvergenceWarning
import sys
# import numpy
from heapq import nlargest
np.set_printoptions(threshold=sys.maxsize)


def fit_model(
    data_df,
    features_array,
    model,
    n_models,
    hyper_param_tuning,
    f1_classification,
    f1_score,
    print_coeffs
):
    accuracy_array = []

    # Matrix of the coefficients used by each parameter
    # matrix_coeffs = np.array()

    # Bootstrapping: Create 50 models of 1,000 random genes each and
    # calculate each model's accuracy
    for _ in range(1, (n_models + 1)):
        x_train, x_test, y_train, y_test = train_test_split(data_df,
                                                            features_array,
                                                            test_size=0.2)

        # Fit the model to the data
        fitted_model = model.fit(x_train, y_train)

        # If we need the F1 classification (mostly for progenitor gene
        # sets), print it out
        if f1_classification:
            y_pred = model.predict(x_test)
            print(classification_report(y_test, y_pred))

        # If we aren't doing hyper parameter tuning, score the model
        if not hyper_param_tuning:
            if not f1_score:
                accuracy_array.append(fitted_model.score(x_test, y_test))
            else:
                y_pred = fitted_model.predict(x_test)
                accuracy_array.append(sklearn_f1_score(
                    y_true=y_test,
                    y_pred=y_pred,
                    average='macro'))

        # if print_coeffs:
        #     matrix_coeffs.append(fitted_model.coef_)
        #     #print("     Coefficients: {} ; {}".format(fitted_model.coef_, fitted_model.intercept_))

    # if print_coeffs:
    #     col_averages = np.average(matrix_coeffs, axis=0)
    #     col_names = df.columns
    #     res = dict(zip(col_averages, col_names))
    #     hundred_largest = nlargest(100, res, key=res.get)
    #     print(hundred_largest)

    return accuracy_array


def fit_model_filter_genes(
    model,
    genes_of_interest_files,
    data_mtx_file,
    data_mtx_col_sep,
    features_array_file,
    n_models,
    hyper_param_tuning,
    submodel,
    f1_classification,
    f1_score,
    print_coeffs,
):
    goi_multi_array = []

    print("\nMODEL --- {}".format(model))
    print("     Data file: {}".format(data_mtx_file))
    print("     Genes files: {}".format(genes_of_interest_files))

    # List of transcriptor factors
    for i in range(len(genes_of_interest_files)):
        genes_of_interest_np = np.genfromtxt(genes_of_interest_files[i], dtype='str')
        goi_multi_array.append(genes_of_interest_np)

    for i in range(len(goi_multi_array)):
        goi_multi_array[0] = [val for val in goi_multi_array[0] if val in goi_multi_array[i]]

    genes_of_interest = goi_multi_array[0]

    data_matrix = pd.read_csv(data_mtx_file, sep=data_mtx_col_sep)
    features_array = np.genfromtxt(features_array_file, dtype='str')

    # Keep only genes that are genes of interest
    if genes_of_interest:
        df = data_matrix[data_matrix.columns[data_matrix.columns.isin(genes_of_interest)]]
    else:
        df = data_matrix

    accuracy_matrix = []

    if (len(df.columns) > 1000):
        for _ in (range(1, 10)):
            df_sample = df.sample(
                n=1000,
                replace=False,
                axis=1)
            accuracy_matrix.append(fit_model(
                df_sample,
                features_array,
                model,
                n_models,
                hyper_param_tuning,
                f1_classification,
                f1_score,
                print_coeffs))
    else:
        print("     Warning: Unable to sample dataframe, less than 1,000 columns. Will proceed without sampling")
        accuracy_matrix.append(fit_model(
            df,
            features_array,
            model,
            n_models,
            hyper_param_tuning,
            f1_classification,
            f1_score,
            print_coeffs))

    accuracy_array = list(chain.from_iterable(accuracy_matrix))

    if not hyper_param_tuning:
        print("     Average accuracy: {}".format(np.mean(accuracy_array)))
        print("     Standard deviation: {}".format(np.std(accuracy_array)))
        print("     Accuracy array = {}".format(accuracy_array))
    else:
        print("     Best estimator: {}".format(model.best_estimator_))
        print("     Best parameters: {}".format(model.best_params_))
        print("     Starting run of that model with optimal parameters...")
        optimal_model = submodel(**model.best_params_)
        fit_model_filter_genes(
            optimal_model,
            genes_of_interest_files,
            data_mtx_file,
            data_mtx_col_sep,
            features_array_file,
            50,
            False,
            None,
            f1_classification,
            f1_score,
            print_coeffs)


# @ignore_warnings(category=ConvergenceWarning)
# For all the arrays, there are two possible lengths.
# `model_list`, `n_models`, `hyper_param_tuning`, and `print_coeffs` must
# all have the same length.
# `data_mtx_files`, `data_mtx_col_seps`, and `features_array_files` must
# all have the same length.
def run_model(
    model_list,
    genes_of_interest_files,
    data_mtx_files,
    data_mtx_col_seps,
    features_array_files,
    n_models,
    hyper_param_tuning,
    submodel,
    f1_classification=False,
    f1_score=False,
    print_coeffs=[False, False]
):
    for i in range(len(model_list)):
        for j in range(len(data_mtx_files)):
            fit_model_filter_genes(
                model_list[i],
                genes_of_interest_files,
                data_mtx_files[j],
                data_mtx_col_seps[j],
                features_array_files[j],
                n_models[i],
                hyper_param_tuning[i],
                submodel[i],
                f1_classification,
                f1_score,
                print_coeffs[i])
