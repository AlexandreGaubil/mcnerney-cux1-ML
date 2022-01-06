#
# Cux1 binding targets in CD34 as determined by Jeff Kurkewich
#
# Use the Cux1 binding targets in CD34 as the list of genes to use as the
# dataset for our models (both linear regression & dnn).
#


# ---- LIBRARIES ----

import numpy as np
import pandas as pd
import os, sys
sys.path.insert(1, os.path.join(sys.path[0], '..'))
from fitting_filter_genes import fit_model_filter_genes
import logistic_regression, dnn, fitting

os.chdir(os.path.dirname(os.path.abspath(__file__)))


# ---- MODELS ----

# Cux1 Biding sites (Jeff Kurkewich)
fit_model_filter_genes(model = logistic_regression.model,
                       genes_of_interest_files = ['./../../data/input/experiment_datasets/Exp_Cux1_binding_targets_CD34_Jeff_Cut_Run_clean_version.txt'],
                       genes_of_interest_column_names = ['mouse'],
                       genes_of_interest_column_seps = [' '],
                       data_matrix_file = './../../data/output/export_script/all_cells_all_genes_data_headers.txt',
                       data_matrix_column_sep = ' ',
                       features_array_file = './../../data/output/export_script/all_cells_all_genes_features.txt')

# Results for all cell types:
# Average accuracy: 0.672
# Standard deviation: 0.023


# Cux1 Biding sites (Jeff Kurkewich) x DEGs after Cux1 KD (Molly Imgruet)
fit_model_filter_genes(model = logistic_regression.model,
                       genes_of_interest_files = ['./../../data/input/experiment_datasets/Exp_Cux1_binding_targets_CD34_Jeff_Cut_Run_clean_version.txt', './../../data/input/experiment_datasets/molly_shCux1_bulkRNA_DEG_n_CD34_Cux1_binding_intersect.txt'],
                       genes_of_interest_column_names = ['mouse', 'mouse'],
                       genes_of_interest_column_seps = [' ', ' '],
                       data_matrix_file = './../../data/output/export_script/all_cells_all_genes_data_headers.txt',
                       data_matrix_column_sep = ' ',
                       features_array_file = './../../data/output/export_script/all_cells_all_genes_features.txt')

# Results for all cell types:
# Average accuracy: 0.667
# Standard deviation: 0.026


# Cux1 Biding sites (Jeff Kurkewich) x DEGs after Cux1 KD (Weihan Liu)
fit_model_filter_genes(model = logistic_regression.model,
                       genes_of_interest_files = ['./../../data/input/experiment_datasets/Exp_Cux1_binding_targets_CD34_Jeff_Cut_Run_clean_version.txt', './../../data/input/experiment_datasets/wl001_scRNA_LowRen_pseudobulk_allCells_DEG_n_CD34_Cux1_binding_intersect.txt'],
                       genes_of_interest_column_names = ['mouse', 'mouse'],
                       genes_of_interest_column_seps = [' ', ' '],
                       data_matrix_file = './../../data/output/export_script/all_cells_all_genes_data_headers.txt',
                       data_matrix_column_sep = ' ',
                       features_array_file = './../../data/output/export_script/all_cells_all_genes_features.txt')

# Results for all cell types:
# Average accuracy: 0.690
# Standard deviation: 0.027