#
# Cux1 interest genes
#
# Use the Cux1 binding targets in CD34 as the list of genes to use as the
# dataset for our models (both linear regression & dnn).
#

import numpy as np
import pandas as pd
import os, sys
sys.path.insert(1, os.path.join(sys.path[0], '..'))
from fitting_filter_genes import fit_model_filter_genes
import models

os.chdir(os.path.dirname(os.path.abspath(__file__)))

models_list = [models.log_reg, models.neural_network, models.hyper_param]
n_models_list = [50, 50, 1]
hyper_param_tuning_list = [False, False, True]

gene_files = [
    ['./../../data/input/gene_sets/jeff_cux1_biding_targets.txt'],
    ['./../../data/input/gene_sets/jeff_cux1_biding_targets.txt', './../../data/input/gene_sets/molly_cux1_biding_intersect.txt'],
    ['./../../data/input/gene_sets/jeff_cux1_biding_targets.txt', './../../data/input/gene_sets/weihan_cux1_biding_intersect.txt']
]

data_mtr_files = [
    './../../data/output/export_script/all_cells_all_genes_data_headers.txt',
    './../../data/output/export_script/three_cells_all_genes_data_headers.txt'
]

features_files = [
    './../../data/output/export_script/all_cells_all_genes_features.txt',
    './../../data/output/export_script/three_cells_all_genes_features.txt'
]

for i in range(len(models_list)):
    for j in range(len(gene_files)):
        for k in range(len(data_mtr_files)):
            print(models_list[i])
            print(gene_files[j])
            print(data_mtr_files[k])
            fit_model_filter_genes(model = models_list[i],
                                genes_of_interest_files = gene_files[j],
                                data_matrix_file = data_mtr_files[k],
                                data_matrix_column_sep = ' ',
                                features_array_file = features_files[k],
                                n_models = n_models_list[i],
                                hyper_param_tuning = hyper_param_tuning_list[i])