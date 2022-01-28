#
# Positive control testing using progenitor genes for each blood cell type
#
# Use a set of progenitor genes for each kind of blood cell type to see if it
# has a higher prediction accuracy for that cell type than other cell types
# using logistic regression with the same parameters used by Weinreb (2020)
#


import os, sys
sys.path.insert(1, os.path.join(sys.path[0], '..'))
os.chdir(os.path.dirname(os.path.abspath(__file__)))
import models
import run_model as run


goi_file_sets = [
    ['./../../data/input/gene_sets/prog_genes/Ren_Ba_DEG_progenitor_markers.txt'],
    ['./../../data/input/gene_sets/prog_genes/Ren_CLP_B_DEG_progenitor_markers.txt'],
    ['./../../data/input/gene_sets/prog_genes/Ren_CLP_Pre-B_DEG_progenitor_markers.txt'],
    ['./../../data/input/gene_sets/prog_genes/Ren_DC_DEG_progenitor_markers.txt'],
    ['./../../data/input/gene_sets/prog_genes/Ren_GMP_MoDC_DEG_progenitor_markers.txt'],
    ['./../../data/input/gene_sets/prog_genes/Ren_GMP_MoNeu_DEG_progenitor_markers.txt'],
    ['./../../data/input/gene_sets/prog_genes/Ren_GMP_Neu_DEG_progenitor_markers.txt'],
    ['./../../data/input/gene_sets/prog_genes/Ren_HSC_DEG_progenitor_markers.txt'],
    ['./../../data/input/gene_sets/prog_genes/Ren_MEP_DEG_progenitor_markers.txt']]
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
    print("\n\n\nPOS CTRL PROG GENES")
    run.run_model(
        models,
        goi_file_sets[i],
        data_mtx_files,
        data_mtx_col_seps,
        features_array_files,
        n_models,
        hyper_param_tuning,
        f1_classification = True)