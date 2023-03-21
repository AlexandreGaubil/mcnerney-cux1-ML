#
# Positive control testing using progenitor genes for each blood cell type
#
# Use a set of progenitor genes for each kind of blood cell type to see if it
# has a higher prediction accuracy for that cell type than other cell types
# using logistic regression with the same parameters used by Weinreb (2020)
#


import os
import sys
sys.path.insert(1, os.path.join(sys.path[0], '..'))
os.chdir(os.path.dirname(os.path.abspath(__file__)))
import run_model as run
import default_variables as df

def run_prog(goi_local):
    print("\n\n\nPOS CTRL PROG GENES")
    run.run_model(
        df.models,
        goi_local,
        df.data_files,
        df.data_col_seps,
        df.features_files,
        df.n_models,
        df.hyper_param_tuning,
        df.submodel,
        True,
        df.f1_score,
        df.print_coeffs)
