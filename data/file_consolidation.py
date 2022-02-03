import numpy as np
import pandas as pd
import os
os.chdir(os.path.dirname(os.path.abspath(__file__)))

def save_to_file(filename, array):
    sfile = open(filename, "w")
    for row in array:
        sfile.write(row)
        sfile.write('\n')
    sfile.close()

# Mouse tfs
mouse_tf_df = pd.read_csv('./input/TF_mouse.txt', sep = '\t')
tfs = mouse_tf_df['Symbol'].tolist()
save_to_file("./input/gene_sets/mouse_tfs.txt", tfs)

# Jeff
jeff_df = pd.read_csv('./input/experiment_datasets/Exp_Cux1_binding_targets_CD34_Jeff_Cut_Run_clean_version.txt', sep = ' ')
jeff = jeff_df['mouse'].tolist()
save_to_file('./input/gene_sets/jeff_cux1_biding_targets.txt', jeff)

# Molly
molly_df = pd.read_csv('./input/experiment_datasets/molly_shCux1_bulkRNA_DEG_n_CD34_Cux1_binding_intersect.txt', sep = ' ')
molly = molly_df['mouse'].tolist()
save_to_file('./input/gene_sets/molly_cux1_biding_intersect.txt', molly)

# Weihan
weihan_df = pd.read_csv('./input/experiment_datasets/wl001_scRNA_LowRen_pseudobulk_allCells_DEG_n_CD34_Cux1_binding_intersect.txt', sep = ' ')
weihan = weihan_df['mouse'].tolist()
save_to_file('./input/gene_sets/weihan_cux1_biding_intersect.txt', weihan)

# DEGs Molly
molly_degs_df = pd.read_csv('./input/experiment_datasets/Molly_shCux1_bulk_RNA_DEGs.txt', sep = ' ')
molly_degs = molly_degs_df['genes'].tolist()
save_to_file('./input/gene_sets/Molly_shCux1_bulk_RNA_DEGs.txt', molly_degs)

# DEGs Weihan
weihan_degs_df = pd.read_csv('./input/experiment_datasets/wl001_shRNA_LowRen_DEGs.txt', sep = ' ')
weihan_degs = weihan_degs_df['gene'].tolist()
save_to_file('./input/gene_sets/wl001_shRNA_LowRen_DEGs.txt', weihan_degs)