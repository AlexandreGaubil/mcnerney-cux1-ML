#
# Hyper-parameter Tuning for DNN
#
#
#

from sklearn import svm
from sklearn.model_selection import GridSearchCV

parameters = {
    'alpha': [1e-5, 0.72, 10],
    'hidden_layer_sizes': [(100, 20), (250, 100), (250, 30)],
    'solver': ['adam', 'lbfgs']
}
svc = svm.SVC()
model = GridSearchCV(svc, parameters)