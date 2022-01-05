#
# Negative control testing using logistic regression.
#
# Use 50 random pools of 1,000 genes each and apply logistic regression to it
# using the same parameters used by Weinreb (2020)
#

# ---- LIBRARIES ----

import numpy as np
import pandas as pd
from itertools import chain
import os, sys
sys.path.insert(1, os.path.join(sys.path[0], '..'))
import fitting
import logistic_regression, dnn

os.chdir(os.path.dirname(os.path.abspath(__file__)))

# ---- MODEL ----

# model = logistic_regression.model
model = dnn.model

data_matrix = np.loadtxt('./../../data/output/neg_control/rand_genes_neg_ctrl_data_all_cell_types.txt')
feature_array = np.genfromtxt('./../../data/output/neg_control/rand_genes_neg_ctrl_feature_all_cell_types.txt',
                              dtype = 'str')
df = pd.DataFrame(data_matrix)

accuracy_mtx = fitting.fit_model_rdm_gene_sets(df, feature_array, model, 50, 10)

accuracy_array = list(chain.from_iterable(accuracy_mtx))


# ---- OUTPUT ----

print(accuracy_array)
print("\nAverage accuracy: {}".format(np.mean(accuracy_array)))
print("Standard deviation: {}".format(np.std(accuracy_array)))

# Results for 6 cell types with logistic regression:
# Average accuracy: 0.561
# Standard deviation: 0.040

# Results for 6 cell types with neural network (p_mdl):
# Average accuracy: 0.529
# Standard deviation: 0.036
# Had 27 errors where lbfgs failed to converge on 500