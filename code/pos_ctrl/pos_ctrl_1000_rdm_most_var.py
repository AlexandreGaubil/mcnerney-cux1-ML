#
# Positive control testing using logistic regression.
#
# Use 50 random pools of 1,000 genes each taken from 2,000 most variable genes
# and apply logistic regression to it using the same parameters used by
# Weinreb (2020)
#

# ---- LIBRARIES ----

import numpy as np
import pandas as pd
from itertools import chain
import os, sys
sys.path.insert(1, os.path.join(sys.path[0], '..'))
import models, fitting

os.chdir(os.path.dirname(os.path.abspath(__file__)))


# ---- MODEL ----

print('POSITIVE CONTROL: 1,000 GENES OUT OF 2,000 MOST VARIABLE GENES\n\n\n')

for model in [models.log_reg, models.neural_network]:
    data_matrix = np.loadtxt('./../../data/input/pos_control/pos_ctrl_var_2000_pos_ctrl_data.txt')
    feature_array = np.genfromtxt('./../../data/input/pos_control/pos_ctrl_var_2000_pos_ctrl_feature.txt',
                                dtype = 'str')
    df = pd.DataFrame(data_matrix)

    accuracy_mtx = fitting.fit_model_rdm_gene_sets(df, feature_array, model, 50, 10)

    accuracy_array = list(chain.from_iterable(accuracy_mtx))

    # ---- OUTPUT ----

    print('./../../data/input/pos_control/pos_ctrl_var_2000_pos_ctrl_data.txt')
    print(model)
    print("Average accuracy: {}".format(np.mean(accuracy_array)))
    print("Standard deviation: {}".format(np.std(accuracy_array)))
    print('\n\n')

# Results for 6 cell types with random 1,000 genes:
# Average accuracy: 0.713
# Standard deviation: 0.024