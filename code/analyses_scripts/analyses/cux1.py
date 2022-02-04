#
# Cux1 interest genes
#
# Use the Cux1 binding targets in CD34 as the list of genes to use as the
# dataset for our models (both linear regression & dnn).
#


import os, sys
sys.path.insert(1, os.path.join(sys.path[0], '..'))
os.chdir(os.path.dirname(os.path.abspath(__file__)))
import run_model as run
import default_variables as df

print("\n\n\nCUX1 RELATED GENES")
for i in range(len(df.goi_cux1_binding)):
    run.run_model(
        df.models,
        df.goi_cux1_binding[i],
        df.data_files,
        df.data_col_seps,
        df.features_files,
        df.n_models,
        df.hyper_param_tuning,
        False,
        df.f1_score,
        df.print_coeffs)