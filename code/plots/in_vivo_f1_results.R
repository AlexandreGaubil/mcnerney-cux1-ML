# Add Data

## Negative Control
df <- add_row(df,
              analysis = analysis.neg_ctrl,
              dataset = dataset.in_vivo,
              score_function = score_function.f1,
              n_cell_types = 5,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.375172410680564,
              std_deviation = 0.08503892338670657,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.neg_ctrl,
              dataset = dataset.in_vivo,
              score_function = score_function.f1,
              n_cell_types = 5,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.48117113625823815,
              std_deviation = 0.06584783739526467,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)


## Positive Control: 1,000 Most Variable Genes
df <- add_row(df,
              analysis = analysis.most_var,
              dataset = dataset.in_vivo,
              score_function = score_function.f1,
              n_cell_types = 5,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6738163020887441,
              std_deviation = 0.05459457355599994,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.most_var,
              dataset = dataset.in_vivo,
              score_function = score_function.f1,
              n_cell_types = 5,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6880890286437099,
              std_deviation = 0.05315774167411558,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)


## Positive Control: Mouse Transcription Factors
df <- add_row(df,
              analysis = analysis.mouse_tf,
              dataset = dataset.in_vivo,
              score_function = score_function.f1,
              n_cell_types = 5,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.38444606085280725,
              std_deviation = 0.06520816074936982,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.mouse_tf,
              dataset = dataset.in_vivo,
              score_function = score_function.f1,
              n_cell_types = 5,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.5317948822292516,
              std_deviation = 0.057016118167119836,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)


## Experimental: CUX1 Binding Targets Jeff
# TODO: add t_test_pos_ctrl
df <- add_row(df,
              analysis = analysis.exp_jeff,
              dataset = dataset.in_vivo,
              score_function = score_function.f1,
              n_cell_types = 5,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.42010455965233495,
              std_deviation = 0.052823078666733865,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.exp_jeff,
              dataset = dataset.in_vivo,
              score_function = score_function.f1,
              n_cell_types = 5,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.49235717143746094,
              std_deviation = 0.05843417316458243,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)




## Experimental: CUX1 Binding Targets Jeff inter Molly
df <- add_row(df,
              analysis = analysis.exp_jeff_molly,
              dataset = dataset.in_vivo,
              score_function = score_function.f1,
              n_cell_types = 5,
              model = model.log_reg,
              n_genes = 891,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.5719716709505559,
              std_deviation = 0.05424309816249223,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.exp_jeff_molly,
              dataset = dataset.in_vivo,
              score_function = score_function.f1,
              n_cell_types = 5,
              model = model.nn,
              n_genes = 891,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.6088458861552535,
              std_deviation = 0.06011163548683058,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)



## Experimental: CUX1 Binding Targets Jeff inter Weihan
df <- add_row(df,
              analysis = analysis.exp_jeff_weihan,
              dataset = dataset.in_vivo,
              score_function = score_function.f1,
              n_cell_types = 5,
              model = model.log_reg,
              n_genes = 923,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.6099886745482069,
              std_deviation = 0.05825117073693837,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.exp_jeff_weihan,
              dataset = dataset.in_vivo,
              score_function = score_function.f1,
              n_cell_types = 5,
              model = model.nn,
              n_genes = 923,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.6352995224462258,
              std_deviation = 0.053125409691386336,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)



## Experimental: CUX1 Binding Targets Molly inter DEGs
df <- add_row(df,
              analysis = analysis.exp_molly_deg,
              dataset = dataset.in_vivo,
              score_function = score_function.f1,
              n_cell_types = 5,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6092472190556252,
              std_deviation = 0.06068925951798818,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.exp_molly_deg,
              dataset = dataset.in_vivo,
              score_function = score_function.f1,
              n_cell_types = 5,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.650863456075595,
              std_deviation = 0.05294482363661236,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)



## Experimental: CUX1 Binding Targets Weihan inter DEGs
df <- add_row(df,
              analysis = analysis.exp_weihan_deg,
              dataset = dataset.in_vivo,
              score_function = score_function.f1,
              n_cell_types = 5,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.5903503844983794,
              std_deviation = 0.05809223166125493,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.exp_weihan_deg,
              dataset = dataset.in_vivo,
              score_function = score_function.f1,
              n_cell_types = 5,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6209999404565678,
              std_deviation = 0.0563552967899376,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)