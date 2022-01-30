#
# Result Compilation
#
# Present the results of the analyses as graphs
#

library(ggplot2)
library(stringr)
library(dplyr)
library(stats)
# library(ggpubr)

# String Variables
analysis.neg_ctrl = 'Negative Control - 1,000 Random Genes'
analysis.most_var = 'Positive Control - 1,000 Most Variable Genes'
analysis.mouse_tf = 'Positive Control - Mouse Transcriptor Factors'
analysis.exp_jeff = 'Experimental - CUX1 Binding Targets Jeff'
analysis.exp_jeff_molly = 'Experimental - CUX1 Binding Targets Jeff & Molly'
analysis.exp_jeff_weihan = 'Experimental - CUX1 Binding Targets Jeff & Weihan'
analysis.exp_molly_deg = 'Experimental - CUX1 Binding Targets Molly & DEGs'
analysis.exp_weihan_deg = 'Experimental - CUX1 Binding Targets Weihan & DEGs'
model.log_reg = 'Logistic Regression'
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
                 std_deviation = numeric(),
                 t_test_neg_ctrl = numeric(),
                 t_test_pos_ctrl = numeric())

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
              average = 0.5629604772557792,
              std_deviation = 0.03204714883268205,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.neg_ctrl,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6401936026936026,
              std_deviation = 0.034293703058599086,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.neg_ctrl,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.5483221476510066,
              std_deviation = 0.032453903607203786,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.neg_ctrl,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6094612794612795,
              std_deviation = 0.03977465033741826,
              t_test_neg_ctrl = NaN,
              t_test_pos_ctrl = NaN)


## Positive Control: 1,000 Most Variable Genes
df <- add_row(df,
              analysis = analysis.most_var,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.7053243847874721,
              std_deviation = 0.02651564520931043,
              t_test_neg_ctrl = -72.525,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.most_var,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.7464057239057239,
              std_deviation = 0.024505246484866062,
              t_test_neg_ctrl = -53.396,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.most_var,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.7059433258762118,
              std_deviation = 0.025341446318473123,
              t_test_neg_ctrl = -81.114,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.most_var,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.742415824915825,
              std_deviation = 0.02586566113265932,
              t_test_neg_ctrl = -59.379,
              t_test_pos_ctrl = NaN)


## Positive Control: Mouse Transcription Factors
df <- add_row(df,
              analysis = analysis.mouse_tf,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.5848023862788962,
              std_deviation = 0.03185973127125112,
              t_test_neg_ctrl = -10.242,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.mouse_tf,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6595454545454544,
              std_deviation = 0.037615889018096774,
              t_test_neg_ctrl = -8.0558,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.mouse_tf,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.5744071588366891,
              std_deviation = 0.030112754323777503,
              t_test_neg_ctrl = -12.417,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.mouse_tf,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6401430976430976,
              std_deviation = 0.03405019912060121,
              t_test_neg_ctrl = -12.485,
              t_test_pos_ctrl = NaN)


## Experimental: CUX1 Binding Targets Jeff
# TODO: add t_test_pos_ctrl
df <- add_row(df,
              analysis = analysis.exp_jeff,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.5913124533929903,
              std_deviation = 0.03480920519407004,
              t_test_neg_ctrl = -12.697,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.exp_jeff,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6579713804713806,
              std_deviation = 0.027944684001883584,
              t_test_neg_ctrl = -8.5155,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.exp_jeff,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.5891275167785235,
              std_deviation = 0.036055006103302485,
              t_test_neg_ctrl = -14.062,
              t_test_pos_ctrl = NaN)

df <- add_row(df,
              analysis = analysis.exp_jeff,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6432996632996631,
              std_deviation = 0.03190382715622776,
              t_test_neg_ctrl = -17.824,
              t_test_pos_ctrl = NaN)




## Experimental: CUX1 Binding Targets Jeff inter Molly
df <- add_row(df,
              analysis = analysis.exp_jeff_molly,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.log_reg,
              n_genes = 891,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.6623489932885905,
              std_deviation = 0.02769536092075326,
              t_test_neg_ctrl = -23.465,
              t_test_pos_ctrl = 10.356)

df <- add_row(df,
              analysis = analysis.exp_jeff_molly,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.log_reg,
              n_genes = 891,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.7181060606060606,
              std_deviation = 0.025512312697471264,
              t_test_neg_ctrl = -19.538,
              t_test_pos_ctrl = 7.4011)

df <- add_row(df,
              analysis = analysis.exp_jeff_molly,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.nn,
              n_genes = 891,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.6618120805369128,
              std_deviation = 0.020002814990400748,
              t_test_neg_ctrl = -28.111,
              t_test_pos_ctrl = 14.246)

df <- add_row(df,
              analysis = analysis.exp_jeff_molly,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.nn,
              n_genes = 891,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.7193939393939394,
              std_deviation = 0.024014554050497395,
              t_test_neg_ctrl = -35.005,
              t_test_pos_ctrl = 6.3224)



## Experimental: CUX1 Binding Targets Jeff inter Weihan
df <- add_row(df,
              analysis = analysis.exp_jeff_weihan,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.log_reg,
              n_genes = 923,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.6846979865771812,
              std_deviation = 0.02174703776695377,
              t_test_neg_ctrl = -35.232,
              t_test_pos_ctrl = 6.1585)

df <- add_row(df,
              analysis = analysis.exp_jeff_weihan,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.log_reg,
              n_genes = 923,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.7296212121212123,
              std_deviation = 0.0215328832181802,
              t_test_neg_ctrl = -25.728,
              t_test_pos_ctrl = 5.1074)

df <- add_row(df,
              analysis = analysis.exp_jeff_weihan,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.nn,
              n_genes = 923,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.6645637583892617,
              std_deviation = 0.024263021307409975,
              t_test_neg_ctrl = -30.675,
              t_test_pos_ctrl = 11.285)

df <- add_row(df,
              analysis = analysis.exp_jeff_weihan,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.nn,
              n_genes = 923,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.no,
              average = 0.7327272727272728,
              std_deviation = 0.026091419415696853,
              t_test_neg_ctrl = -29.537,
              t_test_pos_ctrl = 2.4702)



## Experimental: CUX1 Binding Targets Molly inter DEGs
df <- add_row(df,
              analysis = analysis.exp_molly_deg,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6834675615212529,
              std_deviation = 0.028379458256574324,
              t_test_neg_ctrl = -59.652,
              t_test_pos_ctrl = 10.356)

df <- add_row(df,
              analysis = analysis.exp_molly_deg,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.7303619528619528,
              std_deviation = 0.026412554701019074,
              t_test_neg_ctrl = -44.14,
              t_test_pos_ctrl = 9.4356)

df <- add_row(df,
              analysis = analysis.exp_molly_deg,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.677419835943326,
              std_deviation = 0.027492452300087334,
              t_test_neg_ctrl = -64.315,
              t_test_pos_ctrl = 16.165)

df <- add_row(df,
              analysis = analysis.exp_molly_deg,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.7265319865319865,
              std_deviation = 0.0275997457771774,
              t_test_neg_ctrl = -51.241,
              t_test_pos_ctrl = 8.898)



## Experimental: CUX1 Binding Targets Weihan inter DEGs
df <- add_row(df,
              analysis = analysis.exp_weihan_deg,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6712900820283372,
              std_deviation = 0.02671814951700957,
              t_test_neg_ctrl = -55.016,
              t_test_pos_ctrl = 19.159)

df <- add_row(df,
              analysis = analysis.exp_weihan_deg,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.log_reg,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.7300420875420875,
              std_deviation = 0.02575662533181927,
              t_test_neg_ctrl = -44.39,
              t_test_pos_ctrl = 9.7531)

df <- add_row(df,
              analysis = analysis.exp_weihan_deg,
              dataset = dataset.in_vitro,
              n_cell_types = 6,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.6643325876211783,
              std_deviation = 0.02724287774173863,
              t_test_neg_ctrl = -58.014,
              t_test_pos_ctrl = 23.698)

df <- add_row(df,
              analysis = analysis.exp_weihan_deg,
              dataset = dataset.in_vitro,
              n_cell_types = 3,
              model = model.nn,
              n_genes = 1000,
              n_boostraps = n.bootstraps.default,
              n_rdm_gene_samples = n.rdm_gene_samples.default.yes,
              average = 0.7286026936026936,
              std_deviation = 0.027302245321975872,
              t_test_neg_ctrl = -52.33,
              t_test_pos_ctrl = 7.7826)


# Graph

for (i_n_cells in c(3, 6))
{
    for (t_test in c("none", "neg ctrl", "pos ctrl"))
    {
        local_df <- filter(df, n_cell_types == i_n_cells)

        local_df$analysis_n_genes <- paste(local_df$analysis, " (# genes = ", local_df$n_genes, ")", sep = "")

        if (t_test == "none") 
        {
            local_df$t_test <- c(NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN)
        }
        else if (t_test == "neg ctrl")
        {
            local_df$t_test <- local_df$t_test_neg_ctrl
        }
        else if (t_test == "pos ctrl")
        {
            local_df$t_test <- local_df$t_test_pos_ctrl
        }

        local_df$analysis_in_order <-
          factor(local_df$analysis_n_genes,
                 levels = c(
                   "Negative Control - 1,000 Random Genes (# genes = 1000)",
                   "Positive Control - Mouse Transcriptor Factors (# genes = 1000)",
                   "Positive Control - 1,000 Most Variable Genes (# genes = 1000)",
                   "Experimental - CUX1 Binding Targets Jeff (# genes = 1000)",
                   'Experimental - CUX1 Binding Targets Jeff & Molly (# genes = 891)',
                   'Experimental - CUX1 Binding Targets Jeff & Weihan (# genes = 923)',
                   'Experimental - CUX1 Binding Targets Molly & DEGs (# genes = 1000)',
                   'Experimental - CUX1 Binding Targets Weihan & DEGs (# genes = 1000)'
                 ))

        plot_title <- paste("Cell Fate Prediction Accuracy for In-Vitro Dataset Created by Weinred (2020) (Average of 50 models,", i_n_cells, "cells identities)", sep = " ")

        p <- ggplot(data = local_df,
                    aes(model, average, fill=model)) +
          geom_bar(stat="identity") +
          geom_errorbar(aes(ymin=average-std_deviation,
                            ymax=average+std_deviation,
                            color="1 std dev"),
                        width=.2,
                        position=position_dodge(.9)) +
          geom_text(aes(label=t_test, y = 1), 
                    position=position_dodge(width=0.9)) + # vjust=5.25
          scale_color_manual(name = "Legend", values = c("black")) +
          facet_grid(~analysis_in_order, labeller = label_wrap_gen(width = 18, multi_line = TRUE)) +
          scale_x_discrete(labels = function(x) str_wrap(x, width = 8)) +
          coord_cartesian(ylim=c(0.5, 0.76)) +
          xlab("Gene Sets Used for Prediction (if number of genes = 1,000, 10 random samples of 1,000 genes were used)") +
          ylab("Prediction Accuracy") +
          ggtitle(str_wrap(plot_title, width = 125)) +
          guides(fill=guide_legend(title="Model")) +
          theme_classic() +
          theme(panel.grid.major.y = element_line(color = "#808080",
                                                  size = 0.1,
                                                  linetype = 1)) +
          theme(panel.grid.minor.y = element_line(color = "#808080",
                                                  size = 0.1,
                                                  linetype = 1))

        ggsave(filename = paste("Plot - ", i_n_cells, " cells - ", t_test, " t-test.png", sep = ""),
               device = "png",
               plot = p,
               dpi = "retina",
               width = 30,
               height = 15,
               unit = "cm")
    }
}