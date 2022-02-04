#
# Set of models used for our analysis
#
# Logistic regression & neural network
#


from sklearn.neural_network import MLPClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import GridSearchCV


# LOGISTIC REGRESSION
log_reg = LogisticRegression(
    penalty = 'l2',
    dual = False,
    tol = 0.0001,
    # C = [0.008 in vitro; 0.004 in vivo]
    C = 0.008,
    fit_intercept = True,
    intercept_scaling = 1,
    class_weight = None,
    random_state = None,
    solver = 'saga',
    max_iter = 1000,
    multi_class = 'multinomial',
    verbose = 0,
    warm_start = False,
    n_jobs = -1)


# HYPER PARAMETER TUNING
_parameters = {
    'alpha': [1e-5, 0.72, 1, 5, 9, 11],
    'hidden_layer_sizes': [(100, 20), (250, 100), (250, 30), (150, 50)],
    'solver': ['adam']
}
_hyper_param_model_type = MLPClassifier()
hyper_param = GridSearchCV(_hyper_param_model_type, _parameters, n_jobs = -1)