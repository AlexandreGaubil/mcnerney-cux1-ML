#
# Hyper-parameter Tuning for DNN
#
#
#

from sklearn.neural_network import MLPClassifier
from sklearn.model_selection import GridSearchCV

parameters = {
    'alpha': [1e-5, 0.72, 10],
    'hidden_layer_sizes': [(100, 20), (250, 100), (250, 30)],
    'solver': ['adam', 'lbfgs']
}

model_type = MLPClassifier()
model = GridSearchCV(model_type, parameters)