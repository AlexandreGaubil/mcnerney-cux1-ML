import fitting_filter_genes as fit

def run_model(
    model_list,
    genes_of_interest_files,
    data_mtx_files,
    data_mtx_col_seps,
    features_array_files,
    n_models,
    hyper_param_tuning):
    for i in range(len(model_list)):
        for j in range(len(data_mtx_files)):
            fit.fit_model_filter_genes(
                model_list[i],
                genes_of_interest_files,
                data_mtx_files[j],
                data_mtx_col_seps[j],
                features_array_files[j],
                n_models[i],
                hyper_param_tuning[i])