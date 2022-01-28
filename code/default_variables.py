import models as md
import file_strings as st

models = [md.log_reg, md.hyper_param]
data_files = [st.THREE_CELLS_ALL_GENES_DATA, st.ALL_CELLS_ALL_GENES_DATA]
features_files = [st.THREE_CELLS_ALL_GENES_FEATURES, st.ALL_CELLS_ALL_GENES_FEATURES]
data_col_seps = [' ', ' ']
n_models = [50, 1]
hyper_param_tuning = [False, True]