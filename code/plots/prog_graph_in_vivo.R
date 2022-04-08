setwd("~/Documents/Research/mcnerney-cux1-ML-github/code/plots")
source('../result_compilation/in_vivo/f1_score/data_prog.R')

library(ggplot2)
library(stringr)

df <- data.frame(
    analysis = c(
        rep('Logistic Regression', 1800),
        rep('Neural Network', 1800),
        rep('Logistic Regression', 100),
        rep('Neural Network', 100)
    ),
    cell_type = c(
        rep('Basophil', 900),
        rep('Neutrophil', 900),
        rep('Basophil', 900),
        rep('Neutrophil', 900),
        rep('Basophil', 50),
        rep('Neutrophil', 50),
        rep('Basophil', 50),
        rep('Neutrophil', 50)
    ),
    gene_type = c(
        rep('Neutrophil Prog Genes (p = 8.1e-9)', 1800),
        rep('Neutrophil Prog Genes (p = 1.5e-11)', 1800),
        rep('Basophil Prog Genes (p = 7.5e-4)', 100),
        rep('Basophil Prog Genes (p = 4.8e-5)', 100)
    ),
    value = c(
        prog.neu.3c.lr.ba,
        prog.neu.3c.lr.neu,
        prog.neu.3c.nn.ba,
        prog.neu.3c.nn.neu,
        prog.ba.3c.lr.ba,
        prog.ba.3c.lr.neu,
        prog.ba.3c.nn.ba,
        prog.ba.3c.nn.neu
    )
)

df$analysis <- as.factor(df$analysis)
# local_df <- filter(df, df$analysis == 'Logistic Regression')


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
    labs(title = "Progenitor Genes Prediction F1 Score (3 cells)",
         x = "Gene Set",
         y = "F1 Score Prediction Score",
         color = "Cell Fate")

p

ggsave(
    filename = 'Progenitor genes, 3 cells, f1, in vivo.png',
    device = "png",
    plot = p,
    dpi = "retina",
    width = 20,
    height = 13,
    unit = "cm")
