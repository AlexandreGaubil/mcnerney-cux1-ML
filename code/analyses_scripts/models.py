#
# Set of models used for our analysis
#
# Logistic regression & neural network
#

from sklearn.neural_network import MLPClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import GridSearchCV
from sklearn.ensemble import RandomForestClassifier

# RANDOM FOREST
# FIXME: Do a grid search for random forest as well
random_forest = RandomForestClassifier(
    n_estimators=100,
    max_features=1.0)

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

# HYPER PARAMETER TUNING
_parameters = {
    'alpha': [1e-5, 0.72, 1, 5, 9, 11],
    'hidden_layer_sizes': [(100, 20), (250, 100), (250, 30), (150, 50)],
    'solver': ['adam']
}

_hyper_param_model_type = MLPClassifier()

# _f1_score_string = 'accuracy' if df.f1_score else 'f1_macro'
_f1_score_string = 'f1_macro'

hyper_param = GridSearchCV(
    _hyper_param_model_type,
    _parameters,
    scoring=_f1_score_string,
    n_jobs=-1)
