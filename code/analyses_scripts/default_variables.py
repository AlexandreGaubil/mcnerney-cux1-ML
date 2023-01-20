#
# Default variables
#
# Default parameters used for our analyses
#

import models as md
import file_strings as st
from sklearn.metrics import f1_score

models = [md.random_forest]
# models = [md.log_reg, md.hyper_param]
# models = [md.hyper_param]
# data_files = [st.THREE_CELLS_ALL_GENES_DATA, st.ALL_CELLS_ALL_GENES_DATA]
data_files = [st.ALL_CELLS_ALL_GENES_DATA]
# features_files = [st.THREE_CELLS_ALL_GENES_FEATURES, st.ALL_CELLS_ALL_GENES_FEATURES]
features_files = [st.ALL_CELLS_ALL_GENES_FEATURES]
data_col_seps = [' ', ' ']
n_models = [10]
# n_models = [50, 1]
# n_models = [1]
hyper_param_tuning = [False, True]
# hyper_param_tuning = [True]
print_coeffs = [False, False]

# Specifies if all models should calculate f1 score instead of accuracy
f1_score = True

# ----- Genes of Interest files -----

# Negative control: all genes
goi_all_genes = [st.GOI_ALL_GENES]

# Positive control: most variable genes
goi_most_var = [st.GOI_MOST_VAR]

# Positive control: mouse tfs
goi_mouse_tfs = [st.GOI_MOUSE_TFS]

# Experimental: human cd34 HSC DEG genes with strict and loose filters
goi_human = [[st.GOI_HUMAN_LOOSE], [st.GOI_HUMAN_STRICT]]

# Positive control: progenitor genes
goi_prog_ba = [st.GOI_PROG_BA]
goi_prog_b = [st.GOI_PROG_B]
goi_prog_pre_b = [st.GOI_PROG_PRE_B]
goi_prog_dc = [st.GOI_PROG_DC]
goi_prog_mo_dc = [st.GOI_PROG_MO_DC]
goi_prog_mo_neu = [st.GOI_PROG_MO_NEU]
goi_prog_neu = [st.GOI_PROG_NEU]
goi_prog_hsc = [st.GOI_PROG_HSC]
goi_prog_mep = [st.GOI_PROG_MEP]

goi_all_prog = [
    goi_prog_ba,
    goi_prog_b,
    goi_prog_pre_b,
    goi_prog_dc,
    goi_prog_mo_dc,
    goi_prog_mo_neu,
    goi_prog_neu,
    goi_prog_hsc,
    goi_prog_mep]

# Experimental: Cux1 binding targets
goi_cux1_binding = [
    [st.GOI_JEFF],
    [st.GOI_JEFF, st.GOI_MOLLY],
    [st.GOI_JEFF, st.GOI_WEIHAN]]

# Experimental: DEGs for Cux1 binding targets
goi_cux1_deg = [[st.GOI_DEG_MOLLY], [st.GOI_DEG_WEIHAN]]
