#
# Set of models used for our analysis
#
# Logistic regression & neural network
#

from sklearn.neural_network import MLPClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import GridSearchCV
from sklearn.ensemble import RandomForestClassifier
from sklearn.ensemble import GradientBoostingClassifier


# Scoring method
# _f1_score_string = 'accuracy' if df.f1_score else 'f1_macro'
_f1_score_string = 'f1_macro'


# RANDOM FOREST
_random_forest_search_parameters = {
    'n_estimators': [500, 1000, 2000, 3000],
    'max_features': [1.0, "sqrt", "log2"],
    'max_leaf_nodes': [1000, 2000, None],
}

_random_forest_model = RandomForestClassifier()

random_forest = GridSearchCV(
    _random_forest_model,
    _random_forest_search_parameters,
    scoring=_f1_score_string,
    n_jobs=-1)


# GRADIENT BOOSTING
_gradient_boosting_search_parameters = {
    'loss': ['log_loss', 'exponential'],  # exponential = AdaBoost
    "n_estimators": [1, 10, 50, 150, 500],
    "max_leaf_nodes": [2, 10, 50, 100],
}

_gradient_boosting_model = GradientBoostingClassifier()

gradient_boosting = GridSearchCV(
    _gradient_boosting_model,
    _gradient_boosting_search_parameters,
    scoring=_f1_score_string,
    n_jobs=-1)


# LOGISTIC REGRESSION
log_reg = LogisticRegression(
    penalty='l2',
    dual=False,
    tol=0.0001,
    # C=[0.008 in vitro; 0.004 in vivo]
    C=0.008,
    fit_intercept=True,
    intercept_scaling=1,
    class_weight=None,
    random_state=None,
    solver='saga',
    max_iter=1000,
    multi_class='multinomial',
    verbose=0,
    warm_start=False,
    n_jobs=-1)


# NEURAL NETWORK
_neural_network_search_parameters = {
    'alpha': [1e-5, 0.72, 1, 5, 9, 11],
    'hidden_layer_sizes': [(100, 20), (250, 100), (250, 30), (150, 50)],
    'solver': ['adam']
}

_neural_network_model = MLPClassifier()

neural_network = GridSearchCV(
    _neural_network_model,
    _neural_network_search_parameters,
    scoring=_f1_score_string,
    n_jobs=-1)
