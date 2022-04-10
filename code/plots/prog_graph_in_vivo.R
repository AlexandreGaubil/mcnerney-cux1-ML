library(ggplot2)
library(stringr)


df <- read.csv(file = "prog_gene_analysis_result.csv")

df$analysis <- as.factor(df$analysis)

p <- ggplot(df,
            aes(x = gene_type,
                y = value,
                color = cell_type)) +
    geom_boxplot(outlier.shape = NA) +
    facet_grid(~analysis,
               labeller = label_wrap_gen(width = 15, multi_line = TRUE),
               scales = "free_x") +
    #geom_errorbarh(height = 0) +
    ylim(0.55, 0.85) +
    scale_x_discrete(labels = function(x) str_wrap(x, width = 20)) +
    labs(title = "Progenitor Genes Prediction F1 Score (X? cells)",
         x = "Gene Set",
         y = "F1 Score Prediction Score",
         color = "Cell Fate")

p

ggsave(
    filename = 'Progenitor genes, X? cells, f1, in vivo.png',
    device = "png",
    plot = p,
    dpi = "retina",
    width = 40,
    height = 15,
    unit = "cm")
