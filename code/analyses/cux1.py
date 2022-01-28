#
# Cux1 interest genes
#
# Use the Cux1 binding targets in CD34 as the list of genes to use as the
# dataset for our models (both linear regression & dnn).
#


import os, sys
sys.path.insert(1, os.path.join(sys.path[0], '..'))
os.chdir(os.path.dirname(os.path.abspath(__file__)))
import models
import run_model as run


goi_file_sets = [
    ['./../../data/input/gene_sets/jeff_cux1_biding_targets.txt'],
    ['./../../data/input/gene_sets/jeff_cux1_biding_targets.txt', './../../data/input/gene_sets/molly_cux1_biding_intersect.txt'],
    ['./../../data/input/gene_sets/jeff_cux1_biding_targets.txt', './../../data/input/gene_sets/weihan_cux1_biding_intersect.txt']]
models = [models.log_reg, models.hyper_param]
data_mtx_files = [
    './../../data/output/export_script/three_cells_all_genes_data_headers.txt',
    './../../data/output/export_script/all_cells_all_genes_data_headers.txt']
data_mtx_col_seps = [' ', ' ']
features_array_files = [
    './../../data/output/export_script/three_cells_all_genes_features.txt',
    './../../data/output/export_script/all_cells_all_genes_features.txt']
n_models = [50, 1]
hyper_param_tuning = [False, True]


for i in range(len(goi_file_sets)):
    print("\n\n\nCUX1 RELATED GENES")
    run.run_model(
        models,
        goi_file_sets[i],
        data_mtx_files,
        data_mtx_col_seps,
        features_array_files,
        n_models,
        hyper_param_tuning)