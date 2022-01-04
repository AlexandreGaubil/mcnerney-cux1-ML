#
# Logistic Regression
#
# Description
#


# ---- LIBRARIES ----

import pandas
from sklearn.model_selection import train_test_split
from tqdm import tqdm


# ---- FITTING ----

def fit_model_rdm_gene_sets(data_df, features_array, model, n_models, n_sets):
    accuracy_array = []

    for _ in tqdm(range(1, (n_sets + 1))):
        df_sample = data_df.sample(n = 1000,
                                   replace = False,
                                   axis = 1)

        accuracy_array.append(fit_model(df_sample, features_array, model, n_models))

    return accuracy_array

def fit_model(data_df, features_array, model, n_models):
    accuracy_array = []

    # Create 50 models of 1000 random genes each and calculate each model's accuracy
    for _ in tqdm(range(1, (n_models + 1))):
        x_train, x_test, y_train, y_test = train_test_split(data_df,
                                                            features_array,
                                                            test_size = 0.2)

        # Fit the model to the data
        fitted_model = model.fit(x_train, y_train)

        # Score the model accuracy
        accuracy_array.append(fitted_model.score(x_test, y_test))

    return accuracy_array