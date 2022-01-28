from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report


def fit_model(data_df, features_array, model, n_models, hyper_param_tuning = False, f1_classification = False):
    accuracy_array = []

    # Bootstrapping: Create 50 models of 1,000 random genes each and calculate
    # each model's accuracy
    for _ in range(1, (n_models + 1)):
        x_train, x_test, y_train, y_test = train_test_split(data_df,
                                                            features_array,
                                                            test_size = 0.2)

        # Fit the model to the data
        fitted_model = model.fit(x_train, y_train)

        # If we need the F1 classification (mostly for progenitor gene sets),
        # print it out
        if f1_classification:
            y_pred = model.predict(x_test)
            print(classification_report(y_test, y_pred))

        # If we aren't doing hyper parameter tuning, score the model
        if not hyper_param_tuning:
            accuracy_array.append(fitted_model.score(x_test, y_test))

    return accuracy_array