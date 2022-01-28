#
# Negative control testing using logistic regression.
#
# Use 50 random pools of 1,000 genes each and apply logistic regression to it
# using the same parameters used by Weinreb (2020)
#

# ---- LIBRARIES ----
import os, sys
sys.path.insert(1, os.path.join(sys.path[0], '..'))
os.chdir(os.path.dirname(os.path.abspath(__file__)))
import models
import run_model as run


models = [models.log_reg, models.hyper_param]
goi_files = ['./../../data/input/gene_sets/all_genes.txt']
data_mtx_files = [
    './../../data/output/export_script/three_cells_all_genes_data_headers.txt',
    './../../data/output/export_script/all_cells_all_genes_data_headers.txt']
data_mtx_col_seps = [' ', ' ']
features_array_files = [
    './../../data/output/export_script/three_cells_all_genes_features.txt',
    './../../data/output/export_script/all_cells_all_genes_features.txt']
n_models = [50, 1]
hyper_param_tuning = [False, True]


print("\n\n\nNEGATIVE CONTROL: 1,000 RDM GENES")
run.run_model(
    models,
    goi_files,
    data_mtx_files,
    data_mtx_col_seps,
    features_array_files,
    n_models,
    hyper_param_tuning)