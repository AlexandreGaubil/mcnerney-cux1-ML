library(ggplot2)
library(tidyverse)

setwd("~/Documents/Research/mcnerney-cux1-ML-github")


read_gene_file <- function(filename)
{
    filepath <- paste("data/input/gene_sets/", filename, sep = "")
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

df_intersect <- data.frame(most_var = numeric(),
                           mouse_tf = numeric(),
                           binding.jeff = numeric(),
                           binding.molly = numeric(),
                           binding.weihan = numeric(),
                           degs.molly = numeric(),
                           degs.weihan = numeric())

for (gene_set in list_genes)
{
    overlap_list <- list()
    
    for (second_gene_set in list_genes)
    {
        overlap <- length(Reduce(intersect, list(gene_set, second_gene_set)))
        overlap_list <- append(overlap_list, overlap)
    }
    
    df_intersect <- df_intersect %>% add_row(most_var = overlap_list[[1]],
                                             mouse_tf = overlap_list[[2]],
                                             binding.jeff = overlap_list[[3]],
                                             binding.molly = overlap_list[[4]],
                                             binding.weihan = overlap_list[[5]],
                                             degs.molly = overlap_list[[6]],
                                             degs.weihan = overlap_list[[7]])
}

row.names(df_intersect) <- list("most_var", 
                                "mouse_tf",
                                "binding.jeff", 
                                "binding.molly",
                                "binding.weihan",
                                "degs.molly",
                                "degs.weihan")

mtx <- data.matrix(df_intersect)
heatmap(mtx)












gene_sets_names <- list("most_var", 
                        "mouse_tf",
                        "binding.jeff", 
                        "binding.molly",
                        "binding.weihan",
                        "degs.molly",
                        "degs.weihan")

df_other <- data.frame(x = character(),
                       y = character(),
                       value = numeric(),
                       percentage = numeric())

for (i in seq(from = 1, to = 7))
{
    for (j in seq(from = 1, to = 7))
    {
        overlap <- length(Reduce(intersect, 
                                 list(list_genes[[i]], list_genes[[j]])))
        percent <- overlap / length(list_genes[[i]])
        
        df_other <- df_other %>% add_row(x = gene_sets_names[[i]],
                                         y = gene_sets_names[[j]],
                                         value = overlap,
                                         percentage = percent)
    }
}


p <- ggplot(df_other,
            aes(x = x, y = y, fill = percentage)) +
    geom_tile() + 
    geom_text(aes(label = round(percentage, 2))) +
    scale_fill_gradient( trans = 'log' )

ggsave(filename = "Heatmap of gene sets overlap.png",
       device = "png",
       plot = p,
       dpi = "retina",
       width = 30,
       height = 15,
       unit = "cm")

