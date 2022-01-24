#
# Set of models used for our analysis
#
# Logistic regression, neural network, hyper-parameter tuning for neural network
#


# LIBRARIES

from sklearn.neural_network import MLPClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import GridSearchCV


# LOGISTIC REGRESSION

# Construct the model using the same parameters as Weinreb (2020). Some
# parameters had to be changed: solver, multi_class, & max_iter.
log_reg = LogisticRegression(penalty = 'l2',
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



# NEURAL NETWORK
# Optimal network hyper-parameters determined while tuning
neural_network = MLPClassifier(hidden_layer_sizes = (250, 100),
                               # hidden_layer_sizes = [(100, 20) in vitro; (200,20) in vivo],
                               activation = 'relu',
                               solver = 'adam',
                               alpha = 0.72,
                               # alpha = [0.72 in vitro; 10 in vivo],
                               batch_size = 'auto',
                               learning_rate = 'constant',
                               learning_rate_init = 0.001,
                               power_t = 0.5,
                               max_iter = 1000,
                               # max_iter = 200,
                               shuffle = True,
                               random_state = None,
                               tol = 0.0001,
                               verbose = False,
                               warm_start = False,
                               momentum = 0.9,
                               nesterovs_momentum = True,
                               early_stopping = False,
                               validation_fraction = 0.1,
                               beta_1 = 0.9,
                               beta_2 = 0.999,
                               epsilon = 1e-08)

# Model hyper-parameters specified by Weinreb (2020)
neural_weinreb = MLPClassifier(hidden_layer_sizes = (100, 20),
                               # hidden_layer_sizes = [(100, 20) in vitro; (200,20) in vivo],
                               activation = 'relu',
                               solver = 'adam',
                               alpha = 0.72,
                               # alpha = [0.72 in vitro; 10 in vivo],
                               batch_size = 'auto',
                               learning_rate = 'constant',
                               learning_rate_init = 0.001,
                               power_t = 0.5,
                               max_iter = 1000,
                               # max_iter = 200,
                               shuffle = True,
                               random_state = None,
                               tol = 0.0001,
                               verbose = False,
                               warm_start = False,
                               momentum = 0.9,
                               nesterovs_momentum = True,
                               early_stopping = False,
                               validation_fraction = 0.1,
                               beta_1 = 0.9,
                               beta_2 = 0.999,
                               epsilon = 1e-08)

p_mdl = MLPClassifier(solver = 'lbfgs',
                      alpha = 1e-5,
                      hidden_layer_sizes = (500, 250),
                      random_state = None,
                      activation = 'relu',
                      batch_size = 'auto',
                      learning_rate = 'constant',
                      learning_rate_init = 0.001,
                      power_t = 0.5,
                      max_iter = 1000,
                      shuffle = True,
                      tol = 0.0001,
                      verbose = False,
                      warm_start = False,
                      momentum = 0.9,
                      nesterovs_momentum = True,
                      early_stopping = False,
                      validation_fraction = 0.1,
                      beta_1 = 0.9,
                      beta_2 = 0.999,
                      epsilon = 1e-08,
                      n_iter_no_change = 10,
                      max_fun = 15000)




# HYPER PARAMETER TUNING

#_parameters = {
#    'alpha': [1e-5, 0.72, 10],
#    'hidden_layer_sizes': [(100, 20), (250, 100), (250, 30)],
#    'solver': ['adam', 'lbfgs']
#}
_parameters = {
    'alpha': [1e-5, 0.72, 1, 5, 9, 11],
    'hidden_layer_sizes': [(100, 20), (250, 100), (250, 30), (150, 50)],
    'solver': ['adam']
}
_hyper_param_model_type = MLPClassifier()
hyper_param = GridSearchCV(_hyper_param_model_type, _parameters)