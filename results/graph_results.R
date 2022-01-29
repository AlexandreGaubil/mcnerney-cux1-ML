#
# Result Compilation
#
# Present the results of the analyses as graphs
#

library(tidyverse)
library(ggplot2)

df <- data.frame()

df %>% add_row(Analysis = "Negative Control - 1,000 Random Genes",
               n_genes = 1000,
               Log_Reg_All_Cells.avg = 0.555592841163311,
               Log_Reg_All_Cells.std = 0.03279236876430187,
               Log_Reg_Three_Cells.avg = 0.6313383838383839,
               Log_Reg_Three_Cells.std = 0.03139193610927017,
               NN_All_Cells.avg = 0.5648769574944071,
               NN_All_Cells.std = 0.0422694488315239,
               NN_Three_cells.avg = 0.6157407407407407,
               NN_Three_cells.std = 0.03302732544918089)

df %>% add_row(Analysis = "Positive Control - 1,000 Most Variable Genes",
               n_genes = 1000,
               Log_Reg_All_Cells.avg = ,
               Log_Reg_All_Cells.std = ,
               Log_Reg_Three_Cells.avg = ,
               Log_Reg_Three_Cells.std = ,
               NN_All_Cells.avg = ,
               NN_All_Cells.std = ,
               NN_Three_cells.avg = ,
               NN_Three_cells.std = )

df %>% add_row(Analysis = "Positive Control - Mouse Transcriptor Factors",
               n_genes = 1000,
               Log_Reg_All_Cells.avg = 0.601290082028337,
               Log_Reg_All_Cells.std = 0.029800005978490363,
               Log_Reg_Three_Cells.avg = 0.6621212121212122,
               Log_Reg_Three_Cells.std = 0.032926233048637475,
               NN_All_Cells.avg = 0.5779269202087994,
               NN_All_Cells.std = 0.041152907503110715,
               NN_Three_cells.avg = 0.6510942760942762,
               NN_Three_cells.std = 0.035732298445776293)

df %>% add_row(Analysis = "Experimental - CUX1 Binding Jeff",
               n_genes = 1000,
               Log_Reg_All_Cells.avg = 0.5919313944817302,
               Log_Reg_All_Cells.std = 0.0311322241168891,
               Log_Reg_Three_Cells.avg = 0.6548484848484849,
               Log_Reg_Three_Cells.std = 0.030048128248251076,
               NN_All_Cells.avg = 0.592841163310962,
               NN_All_Cells.std = 0.02163208009598849,
               NN_Three_cells.avg = 0.6426767676767676,
               NN_Three_cells.std = 0.045454545454545456)

df %>% add_row(Analysis = "Experimental - CUX1 Binding Jeff & Molly",
               n_genes = 891,
               Log_Reg_All_Cells.avg = 0.6622147651006712,
               Log_Reg_All_Cells.std = 0.026800381316671153,
               Log_Reg_Three_Cells.avg = 0.719621212121212,
               Log_Reg_Three_Cells.std = 0.02390256564948832,
               NN_All_Cells.avg = 0.6308724832214765,
               NN_All_Cells.std = 0,
               NN_Three_cells.avg = 0.6856060606060606,
               NN_Three_cells.std = 0)

df %>% add_row(Analysis = "Experimental - CUX1 Binding Jeff & Weihan",
               n_genes = 923,
               Log_Reg_All_Cells.avg = 0.6821476510067113,
               Log_Reg_All_Cells.std = 0.020134675610241227,
               Log_Reg_Three_Cells.avg = 0.7253030303030303,
               Log_Reg_Three_Cells.std = 0.025971040593225157,
               NN_All_Cells.avg = 0.6778523489932886,
               NN_All_Cells.std = 0,
               NN_Three_cells.avg = 0.7159090909090909,
               NN_Three_cells.std = 0)