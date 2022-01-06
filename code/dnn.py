from sklearn.neural_network import MLPClassifier

# Model hyper-parameters specified by Weinreb (2020)
model = MLPClassifier(hidden_layer_sizes = (100, 20),
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