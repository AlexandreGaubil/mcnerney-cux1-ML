#
# Result Compilation
#
# Present the results of the analyses as graphs
#

setwd("~/Documents/Research/mcnerney-cux1-ML-github/code/plots")
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

df_prog <- data.frame(
    analysis = character(),
    dataset = character(),
    score_function = character(),
    n_cell_types = integer(),
    model = character(),
    cell_type = character(),
    average = numeric(),
    std_deviation = numeric())

source('in_vitro_accuracy_results.R')
source('in_vitro_f1_results.R')
source('in_vivo_f1_results.R')
# source('in_vitro_f1_prog_results.R')
source('in_vitro_f1_prog_results_ba_and_neu.R')



# Function to save the specified plot p
save_plot <- function(filename, p, width_param = 30)
{
   ggsave(
    filename = paste0(filename, ".png"),
    device = "png",
    plot = p,
    dpi = "retina",
    width = width_param,
    height = 15,
    unit = "cm")
}


# Title Generation
generate_plot_title <- function(dataset, n_cells, score_func)
{
    n_cells_title <- ""
    if (!(is.nan(n_cells)))
        n_cells_title <- paste0(", ", n_cells, " cell fates")

    if (!(is.nan(n_cells)) & !(is.nan(score_func)))
        n_cells_title <- paste0(n_cells_title, ", ", score_func)

    score_func_title <- ""
    if (is.nan(n_cells) & !(is.nan(score_func)))
        score_func_title <- paste0(", ", score_func)

    plot_title <- paste0(
        "Cell Fate Prediction for ",
        dataset,
        " Dataset (Average of 50 models",
        n_cells_title,
        score_func_title,
        ")")

    return(plot_title)
}


# Function to generate a plot
generate_plot <- function(dataset_name, n_cells, score_func, t_test, x_label)
{
    # Filter based on the dataset (either in vitro or in vivo)
    local_df <- filter(df, dataset == dataset_name)

    # Filter based on number of cell types
    if (!(is.nan(n_cells)))
        local_df <- filter(local_df, n_cell_types == n_cells)
    
    # Filter based on the scoring method used (F1, accuracy, etc.)
    if (!(is.nan(score_func)))
        local_df <- filter(local_df, score_function == score_func)
    # If no scoring method was specified, combine the model and the scoring method into one
    else
        local_df$model <- paste0(local_df$model, ", ", local_df$score_function)
    
    # If we should display the t_tests, set the t_test column to the appropriate values
    if (t_test == "neg ctrl")
        local_df$t_test <- local_df$t_test_neg_ctrl
    else if (t_test == "pos ctrl")
        local_df$t_test <- local_df$t_test_pos_ctrl

    # Used for the top category legend (show the gene dataset & the number of genes)
    local_df$analysis_n_genes <- paste0(local_df$analysis, " (# genes = ", local_df$n_genes, ")")

    # Order the gene sets so that they are in a valid order in the graph
    local_df$analysis_in_order <-
        factor(
            local_df$analysis_n_genes,
            levels = c(
                "Negative Control - 1,000 Random Genes (# genes = 1000)",
                "Positive Control - Mouse Transcriptor Factors (# genes = 1000)",
                "Positive Control - 1,000 Most Variable Genes (# genes = 1000)",
                "Experimental - CUX1 Binding Targets Jeff (# genes = 1000)",
                'Experimental - CUX1 Binding Targets Jeff & Molly (# genes = 891)',
                'Experimental - CUX1 Binding Targets Jeff & Weihan (# genes = 923)',
                'Experimental - CUX1 Molly DEGs (# genes = 1000)',
                'Experimental - CUX1 Weihan DEGs (# genes = 1000)',
                'Experimental - Human HSC DEGs Strict Threshold (# genes = 367)',
                'Experimental - Human HSC DEGs Loose Threshold (# genes = 594)'
            ))

    # Set the plot, axis, & legend title
    plot_title <- generate_plot_title(dataset_name, n_cells, score_func)
    x_axis_title <- "Gene Sets Used for Prediction (if number of genes = 1,000, 10 random samples of 1,000 genes were used)"
    y_axis_title <- "Prediction Score"
    legend_title <- "Model"
    if (is.nan(score_func))
        legend_title <- "Model & Scoring Function"

    # Generate the plot
    p <- ggplot(data = local_df,
                aes(model, average, fill = model)) +
        geom_bar(stat="identity") +
        geom_errorbar(
            aes(ymin=average-std_deviation,
                ymax=average+std_deviation,
                color="1 std dev"),
            width=.2,
            position=position_dodge(.9)) +
        { if (!(is.nan(t_test))) geom_text(aes(label=t_test, y = 1), position=position_dodge(width=0.9)) } +
        scale_color_manual(name = "Error Bars", values = c("black")) +
        facet_grid(~analysis_in_order, labeller = label_wrap_gen(width = 15, multi_line = TRUE)) +
        { if (x_label) scale_x_discrete(labels = function(x) str_wrap(x, width = 8))
          else scale_x_discrete(labels = function(x) "") } +
        coord_cartesian(ylim=c(0.3, 0.8)) +
        scale_y_continuous(breaks = round(seq(0.3, 0.8, by = 0.1),1)) +
        xlab(x_axis_title) +
        ylab(y_axis_title) +
        ggtitle(str_wrap(plot_title, width = 125)) +
        guides(fill=guide_legend(title=legend_title)) +
        theme_classic() +
        theme(panel.grid.major.y = element_line(color = "#808080",
                                                size = 0.1,
                                                linetype = 1)) +
        theme(panel.grid.minor.y = element_line(color = "#808080",
                                                size = 0.1,
                                                linetype = 2))

    return(p)
}




# Function to generate a plot for progenitor cells
generate_plot_prog <- function(dataset, n_cells, model_to_keep, score_func, x_label)
{
    # Filter based on the dataset (either in vitro or in vivo)
    local_df <- filter(df_prog, dataset == dataset)

    # Filter based on number of cell types
    if (!(is.nan(n_cells)))
        local_df <- filter(local_df, n_cell_types == n_cells)

    # Filter based on model used
    if (!(is.nan(model_to_keep)))
        local_df <- filter(local_df, model == model_to_keep)

    # Filter based on the scoring method used (F1, accuracy, etc.)
    if (!(is.nan(score_func)))
        local_df <- filter(local_df, score_function == score_func)
    # If no scoring method was specified, combine the model and the scoring method into one
    else
        local_df$model <- paste0(local_df$model, ", ", local_df$score_function)

    # Used for the top category legend (show the gene dataset & the number of genes)
    local_df$model <- paste0(local_df$model, ", ", local_df$cell_type)

    # Order the gene sets so that they are in a sensical order in the graph
    local_df$analysis_in_order <-
        factor(
            local_df$analysis,
            levels = c(
                analysis.prog.DC,
                analysis.prog.ba,
                analysis.prog.modc,
                analysis.prog.moneu,
                analysis.prog.b,
                analysis.prog.preb,
                analysis.prog.neu,
                analysis.prog.hsc,
                analysis.prog.mep
            ))

    color_palette <- c("#999999", "#E69F00", "#56B4E9")

    # Set the plot, axis, & legend title
    plot_title <- generate_plot_title(dataset, n_cells, score_func)
    x_axis_title <- "Progenitor Gene Sets Used for Prediction"
    y_axis_title <- "Prediction Score"
    legend_title <- "Model"
    if (is.nan(score_func))
        legend_title <- "Model & Scoring Function"

    # Generate the plot
    p <- ggplot(data = local_df,
                aes(model, average, fill = model)) +
        geom_bar(stat="identity") +
        geom_errorbar(
            aes(ymin=average-std_deviation,
                ymax=average+std_deviation,
                color="1 std dev"),
            width=.2,
            position=position_dodge(.9)) +
        scale_color_manual(name = "Error Bars", values = c("black")) +
        scale_fill_manual(values = color_palette) +
        facet_grid(~analysis_in_order, labeller = label_wrap_gen(width = 15, multi_line = TRUE)) +
        { if (x_label) scale_x_discrete(labels = function(x) str_wrap(x, width = 8))
          else scale_x_discrete(labels = function(x) "") } +
        coord_cartesian(ylim=c(0.3, 0.8)) +
        scale_y_continuous(breaks = round(seq(0.3, 0.8, by = 0.1),1)) +
        xlab(x_axis_title) +
        ylab(y_axis_title) +
        ggtitle(str_wrap(plot_title, width = 125)) +
        guides(fill=guide_legend(title=legend_title)) +
        theme_classic() +
        theme(panel.grid.major.y = element_line(color = "#808080",
                                                size = 0.1,
                                                linetype = 1)) +
        theme(panel.grid.minor.y = element_line(color = "#808080",
                                                size = 0.1,
                                                linetype = 2))

    return(p)
}





save_plot(
    "In vitro, 3 cells, f1",
    generate_plot(
        dataset_name = dataset.in_vitro,
        n_cells = 3,
        score_func = score_function.f1,
        t_test = NaN,
        x_label = FALSE)
)

save_plot(
    "In vivo, 6 cells, f1",
    generate_plot(
        dataset_name = dataset.in_vivo,
        n_cells = 6,
        score_func = score_function.f1,
        t_test = NaN,
        x_label = FALSE),
    width_param = 36
)

save_plot(
    "In vitro, 6 cells, f1",
    generate_plot(
        dataset = dataset.in_vitro,
        n_cells = 6,
        score_func = score_function.f1,
        t_test = NaN,
        x_label = FALSE),
    width_param = 36
)

save_plot(
    "In vitro, 3 cells, f1 & accuracy",
    generate_plot(
        dataset = dataset.in_vitro,
        n_cells = 3,
        score_func = NaN,
        t_test = NaN,
        x_label = FALSE)
)
save_plot(
    "In vitro, 6 cells, f1 & accuracy",
    generate_plot(
        dataset = dataset.in_vitro,
        n_cells = 6,
        score_func = NaN,
        t_test = NaN,
        x_label = FALSE)
)

save_plot(
    "In vitro, 3 cells, f1, log reg, prog",
    generate_plot_prog(
        dataset = dataset.in_vitro,
        n_cells = 3,
        model_to_keep = model.log_reg,
        score_func = score_function.f1,
        x_label = FALSE),
    width_param = 15
)
save_plot(
    "In vitro, 3 cells, f1, neural network, prog",
    generate_plot_prog(
        dataset = dataset.in_vitro,
        n_cells = 3,
        model_to_keep = model.nn,
        score_func = score_function.f1,
        x_label = FALSE),
    width_param = 15
)
