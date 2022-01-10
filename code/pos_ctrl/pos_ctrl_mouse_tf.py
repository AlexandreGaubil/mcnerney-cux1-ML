#
# Positive control testing using logistic regression over TF List
#
# Use the TF list provided by AnimalTFDB3.0
# (http://bioinfo.life.hust.edu.cn/AnimalTFDB/#!/download)
# and apply logistic regression to it using the same parameters used by
# Weinreb (2020)
#

# ---- LIBRARIES ----

import numpy as np
import pandas as pd
import os, sys
sys.path.insert(1, os.path.join(sys.path[0], '..'))
import models, fitting

os.chdir(os.path.dirname(os.path.abspath(__file__)))

print('POSITIVE CONTROL MOUSE TFS\n\n\n')

# ---- MODEL ----
for model in [models.log_reg, models.neural_network]:
    mouse_tf_df = pd.read_csv('./../../data/input/pos_ctrl/pos_ctrl_mus_musculus_TF_animal_TFDB.txt', sep = '\t')

    # List of transcriptor factors
    tfs = mouse_tf_df['Symbol'].tolist()

    data_matrix = pd.read_csv('./../../data/output/export_script/all_cells_all_genes_data_headers.txt', sep = ' ')
    feature_array = np.genfromtxt('./../../data/output/export_script/all_cells_all_genes_features.txt', dtype = 'str')

    # Keep only genes that are mouse transcription factors
    df = data_matrix[data_matrix.columns[data_matrix.columns.isin(tfs)]]

    accuracy_array = fitting.fit_model(df, feature_array, model, 50)

    # ---- OUTPUT ----
    print('./../../data/output/export_script/all_cells_all_genes_data_headers.txt')
    print(model)
    print("Average accuracy: {}".format(np.mean(accuracy_array)))
    print("Standard deviation: {}".format(np.std(accuracy_array)))
    print('\n\n')