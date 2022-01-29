#
# Result Compilation
#
# Present the results of the analyses as graphs
#

library(ggplot2)
library(dplyr)
library(stats)

# String Variables
analysis.neg_ctrl = 'Negative Control - 1,000 Random Genes'
analysis.most_var = 'Positive Control - 1,000 Most Variable Genes'
analysis.mouse_tf = 'Positive Control - Mouse Transcriptor Factors'
analysis.exp_jeff = 'Experimental - CUX1 Binding Jeff'
analysis.exp_jeff_molly = 'Experimental - CUX1 Binding Jeff & Molly'
analysis.exp_jeff_weihan = 'Experimental - CUX1 Binding Jeff & Weihan'
model.log_reg = 'Logistic  Regression'
model.nn = 'Neural Network'
dataset.in_vivo = 'In vivo'
dataset.in_vitro = 'In vitro'
n.bootstraps.default = 50
n.rdm_gene_samples.default.yes = 10
n.rdm_gene_samples.default.no = 1


df <- data.frame(analysis = character(),
                 dataset = character(),
                 n_cell_types = integer(),
                 model = character(),
                 n_genes = integer(),
                 n_boostraps = integer(),
                 n_rdm_gene_samples = integer(),
                 average = numeric(),
                 std_deviation = numeric())

# Add Data

## Negative Control
df <- add_row(df,
              analysis = analysis.neg_ctrl,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.555592841163311,
              std_deviation = 0.03279236876430187)

df <- add_row(df,
              analysis = analysis.neg_ctrl,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6313383838383839,
              std_deviation = 0.03139193610927017)

df <- add_row(df,
              analysis = analysis.neg_ctrl,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.5681953765846384,
              std_deviation = 0.03931263003915425)

df <- add_row(df,
              analysis = analysis.neg_ctrl,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6168181818181819,
              std_deviation = 0.03663378189765403)


## Positive Control: 1,000 Most Variable Genes
df <- add_row(df,
              analysis = analysis.most_var,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.7112900820283371,
              std_deviation = 0.025929285583589912)

df <- add_row(df,
              analysis = analysis.most_var,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.7496885521885522,
              std_deviation = 0.023968596188772454)

df <- add_row(df,
              analysis = analysis.most_var,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = NaN,
              std_deviation = NaN)

df <- add_row(df,
              analysis = analysis.most_var,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = NaN,
              std_deviation = NaN)


## Positive Control: Mouse Transcription Factors
df <- add_row(df,
              analysis = analysis.mouse_tf,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.601290082028337,
              std_deviation = 0.029800005978490363)

df <- add_row(df,
              analysis = analysis.mouse_tf,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6621212121212122,
              std_deviation = 0.032926233048637475)

df <- add_row(df,
              analysis = analysis.mouse_tf,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.5779269202087994,
              std_deviation = 0.041152907503110715)

df <- add_row(df,
              analysis = analysis.mouse_tf,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6510942760942762,
              std_deviation = 0.035732298445776293)


## Experimental: CUX1 Binding Targets Jeff
df <- add_row(df,
              analysis = analysis.exp_jeff,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.5919313944817302,
              std_deviation = 0.0311322241168891)

df <- add_row(df,
              analysis = analysis.exp_jeff,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6548484848484849,
              std_deviation = 0.030048128248251076)

df <- add_row(df,
              analysis = analysis.exp_jeff,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.592841163310962,
              std_deviation = 0.02163208009598849)

df <- add_row(df,
              analysis = analysis.exp_jeff,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6426767676767676,
              std_deviation = 0.045454545454545456)




## Experimental: CUX1 Binding Targets Jeff inter Molly
df <- add_row(df,
              analysis = analysis.exp_jeff_molly,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.log_reg,
              n_genes = 891,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.6622147651006712,
              std_deviation = 0.026800381316671153)

df <- add_row(df,
              analysis = analysis.exp_jeff_molly,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.log_reg,
              n_genes = 891,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.719621212121212,
              std_deviation = 0.02390256564948832)

df <- add_row(df,
              analysis = analysis.exp_jeff_molly,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.nn,
              n_genes = 891,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.6308724832214765,
              std_deviation = NaN)

df <- add_row(df,
              analysis = analysis.exp_jeff_molly,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.nn,
              n_genes = 891,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.6856060606060606,
              std_deviation = NaN)


## Experimental: CUX1 Binding Targets Jeff inter Weihan
df <- add_row(df,
              analysis = analysis.exp_jeff_weihan,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.log_reg,
              n_genes = 923,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.6821476510067113,
              std_deviation = 0.020134675610241227)

df <- add_row(df,
              analysis = analysis.exp_jeff_weihan,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.log_reg,
              n_genes = 923,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.7253030303030303,
              std_deviation = 0.025971040593225157)

df <- add_row(df,
              analysis = analysis.exp_jeff_weihan,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.nn,
              n_genes = 923,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.6778523489932886,
              std_deviation = NaN)

df <- add_row(df,
              analysis = analysis.exp_jeff_weihan,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.nn,
              n_genes = 923,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.7159090909090909,
              std_deviation = NaN)