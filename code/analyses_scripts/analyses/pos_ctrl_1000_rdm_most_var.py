#
# Positive control testing using logistic regression.
#
# Use 50 random pools of 1,000 genes each taken from 2,000 most variable genes
# and apply logistic regression to it using the same parameters used by
# Weinreb (2020)
#


import os, sys
sys.path.insert(1, os.path.join(sys.path[0], '..'))
os.chdir(os.path.dirname(os.path.abspath(__file__)))
import run_model as run
import default_variables as df

print("\n\n\nPOSITIVE CONTROL: 1,000 MOST VARIABLE GENES")
run.run_model(
    df.models,
    df.goi_most_var,
    df.data_files,
    df.data_col_seps,
    df.features_files,
    df.n_models,
    df.hyper_param_tuning,
    False,
    df.f1_score)