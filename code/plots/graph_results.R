#
# Result Compilation
#
# Present the results of the analyses as graphs
#

library(ggplot2)
library(stringr)
library(dplyr)
# library(stats)
source('model_strings.R')
# library(ggpubr)


df <- data.frame(analysis = character(),
                 dataset = character(),
                 score_function = character(),
                 n_cell_types = integer(),
                 model = character(),
                 n_genes = integer(),
                 n_boostraps = integer(),
                 n_rdm_gene_samples = integer(),
                 average = numeric(),
                 std_deviation = numeric(),
                 t_test_neg_ctrl = numeric(),
                 t_test_pos_ctrl = numeric())

source('in_vitro_accuracy_results.R')
source('in_vitro_f1_results.R')
# Graph

for (score_func in list(score_function.accuracy, score_function.f1))
{
    for (i_n_cells in c(3, 6))
    {
        # for (t_test in c("none", "neg ctrl", "pos ctrl"))
        for (t_test in c("none"))
        {
            local_df <- filter(df, n_cell_types == i_n_cells)
            local_df <- filter(local_df, score_function == score_func)
            
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
                           'Experimental - CUX1 Molly DEGs (# genes = 1000)',
                           'Experimental - CUX1 Weihan DEGs (# genes = 1000)'
                       ))
            
            plot_title <- paste(
                "Cell Fate Prediction for In-Vitro Dataset Created by Weinred (2020) (Average of 50 models, ", 
                i_n_cells, 
                " cells identities, ", 
                score_func, 
                ")", 
                sep = "")
            
            p <- ggplot(data = local_df,
                        aes(model, average, fill=model)) +
                geom_bar(stat="identity") +
                geom_errorbar(aes(ymin=average-std_deviation,
                                  ymax=average+std_deviation,
                                  color="1 std dev"),
                              width=.2,
                              position=position_dodge(.9)) +
                #geom_text(aes(label=t_test, y = 1),
                #          position=position_dodge(width=0.9)) + # vjust=5.25
                scale_color_manual(name = "Legend", values = c("black")) +
                facet_grid(~analysis_in_order, labeller = label_wrap_gen(width = 15, multi_line = TRUE)) +
                scale_x_discrete(labels = function(x) str_wrap(x, width = 8)) +
                coord_cartesian(ylim=c(0.2, 0.76)) +
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
            
            ggsave(
                filename = paste(
                    "Plot - ",
                    i_n_cells, 
                    " cells - ", 
                    score_func,
                    " - ",
                    t_test, 
                    " t-test.png",
                    sep = ""),
                device = "png",
                plot = p,
                dpi = "retina",
                width = 30,
                height = 15,
                unit = "cm")
        }
    }
}