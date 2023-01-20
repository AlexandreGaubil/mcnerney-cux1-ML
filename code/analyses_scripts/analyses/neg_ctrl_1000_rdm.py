#
# Negative control testing using logistic regression.
#
# Use 1,000 random genes amongst the entire gene set we have sequenced and apply
# the different models we have to them.
#


import os
import sys
sys.path.insert(1, os.path.join(sys.path[0], '..'))
os.chdir(os.path.dirname(os.path.abspath(__file__)))
import run_model as run
import default_variables as df

print("\n\n\nNEGATIVE CONTROL: 1,000 RDM GENES")
run.run_model(
    df.models,
    df.goi_all_genes,
    df.data_files,
    df.data_col_seps,
    df.features_files,
    df.n_models,
    df.hyper_param_tuning,
    False,
    df.f1_score,
    df.print_coeffs)

