library(ggplot2)
library(tidyverse)
library(stringr)

setwd("~/Documents/Research/mcnerney-cux1-ML-github")
setwd("~/CUX1_ML_Github/")


# ----- Data -----

read_gene_file <- function(filename)
{
    filepath <- paste("data/gene_sets/", filename, sep = "")
    print(filepath)
    dat = readLines(filepath)
    
    return(dat)
}

genes.most_var <- read_gene_file("2000_most_degs.txt")
genes.mouse_tf <- read_gene_file("mouse_tfs.txt")
genes.binding.jeff <- read_gene_file("jeff_cux1_biding_targets.txt")
genes.binding.molly <- read_gene_file("molly_cux1_biding_intersect.txt")
genes.binding.weihan <- read_gene_file("weihan_cux1_biding_intersect.txt")
genes.degs.molly <- read_gene_file("Molly_shCux1_bulk_RNA_DEGs.txt")
genes.degs.weihan <- read_gene_file("wl001_shRNA_LowRen_DEGs.txt")

list_genes <- list(genes.most_var, 
                   genes.mouse_tf,
                   genes.binding.jeff, 
                   genes.binding.molly,
                   genes.binding.weihan,
                   genes.degs.molly,
                   genes.degs.weihan)

gene_sets_names <- list("Most var", 
                        "Mouse TFs",
                        "Jeff BT", 
                        "Molly & Jeff BT",
                        "Weihan & Jeff BT",
                        "Molly DEGs",
                        "Weihan DEGs")

df_intersect <- data.frame(x = character(),
                           y = character(),
                           value = numeric(),
                           percentage = numeric(),
                           order_x = numeric(),
                           order_y = numeric())

for (i in seq(from = 1, to = 7))
{
    for (j in seq(from = 1, to = 7))
    {
        overlap <- length(Reduce(intersect, 
                                 list(list_genes[[i]], list_genes[[j]])))
        
        percent <- overlap / length(list_genes[[i]])
        
        df_intersect <- df_intersect %>% add_row(x = gene_sets_names[[i]],
                                                 y = gene_sets_names[[j]],
                                                 value = overlap,
                                                 percentage = percent,
                                                 order_x = i,
                                                 order_y = j)
    }
}

df_intersect$percentage.rounded <- with(df_intersect, round(percentage, 2))

df_intersect$x <- factor(df_intersect$x, levels = gene_sets_names)
df_intersect$y <- factor(df_intersect$y, levels = gene_sets_names)



# ----- Plot -----

# ----- Plot parameters ------

plot.title <- ""#"Heatmap of Gene Sets Overlap for In-Vitro Dataset"
plot.legend.title <- "Percentage of X that is in Y"

scale_fun <- function(x) sprintf("%.2f", x)
round_fun <- function(x) round(x, 2)


# ----- Plot construction -----

p <- ggplot(df_intersect,
            aes(x = x, 
                y = y, 
                fill = percentage)) +
    geom_tile(color = "black") + 
    geom_text(aes(label = round_fun(percentage))) +
    scale_fill_gradient(trans = 'log',
                        low = "white", 
                        high = "red",
                        labels=scale_fun,
                        name = str_wrap(plot.legend.title, width=15))+
    #scale_x_discrete(limits=(df_intersect$x)[order(df_intersect$order_x)]) + 
    #scale_y_discrete(limits=(df_intersect$y)[order(df_intersect$order_y)]) +
    xlab("X (Reference)") + 
    ylab("Y (Comparison)") +
    ggtitle(str_wrap(plot.title, width=125))

ggsave(filename = "Heatmap of gene sets overlap.png",
       device = "png",
       plot = p,
       dpi = "retina",
       width = 30,
       height = 15,
       unit = "cm")
