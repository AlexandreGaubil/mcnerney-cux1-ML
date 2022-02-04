#
# Positive control testing using logistic regression over TF List
#
# Use the TF list provided by AnimalTFDB3.0
# (http://bioinfo.life.hust.edu.cn/AnimalTFDB/#!/download)
# and apply logistic regression to it using the same parameters used by
# Weinreb (2020)
#


import os, sys
sys.path.insert(1, os.path.join(sys.path[0], '..'))
os.chdir(os.path.dirname(os.path.abspath(__file__)))
import run_model as run
import default_variables as df

print("\n\n\nPOSITIVE CONTROL: MOUSE TFS")
run.run_model(
    df.models,
    df.goi_mouse_tfs,
    df.data_files,
    df.data_col_seps,
    df.features_files,
    df.n_models,
    df.hyper_param_tuning,
    False,
    df.f1_score,
    df.print_coeffs)