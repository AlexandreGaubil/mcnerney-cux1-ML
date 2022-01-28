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
import run_model as run
import file_strings as st
import default_variables as df

goi_files = [st.GOI_ALL_GENES]

print("\n\n\nNEGATIVE CONTROL: 1,000 RDM GENES")
run.run_model(
    df.models,
    goi_files,
    df.data_files,
    df.data_col_seps,
    df.features_files,
    df.n_models,
    df.hyper_param_tuning)