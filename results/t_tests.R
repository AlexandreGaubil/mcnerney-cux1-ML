#
# T-Tests
#
# T-Test significance testing for all the datasets we produced, comparing them
# to the negative control, positive controls, and comparing Cux1 binding
# targets alone to Cux1 binding targets intersected with DEGs
#

# setwd(dirname(rstudioapi::getSourceEditorContext()$path))

source('data_most_var.R')
source('data_cux1_degs.R')
source('data_cux1.R')
source('data_mouse_tf.R')
source('data_neg_ctrl.R')

library(stats)



print('\n\n\n\nNegative Control & All Datasets')
print(' ----- 3C, LR')

print(t.test(neg_ctrl.3c.lr, most_var.3c.lr))
print(t.test(neg_ctrl.3c.lr, mouse_tf.3c.lr))
print(t.test(neg_ctrl.3c.lr, cux1.jeff.3c.lr))
print(t.test(neg_ctrl.3c.lr, cux1.jeff_molly.3c.lr))
print(t.test(neg_ctrl.3c.lr, cux1.jeff_weihan.3c.lr))
print(t.test(neg_ctrl.3c.lr, cux1_degs.molly.3c.lr))
print(t.test(neg_ctrl.3c.lr, cux1_degs.weihan.3c.lr))

print(' ----- 6C, LR')

print(t.test(neg_ctrl.6c.lr, most_var.6c.lr))
print(t.test(neg_ctrl.6c.lr, mouse_tf.6c.lr))
print(t.test(neg_ctrl.6c.lr, cux1.jeff.6c.lr))
print(t.test(neg_ctrl.6c.lr, cux1.jeff_molly.6c.lr))
print(t.test(neg_ctrl.6c.lr, cux1.jeff_weihan.6c.lr))
print(t.test(neg_ctrl.6c.lr, cux1_degs.molly.6c.lr))
print(t.test(neg_ctrl.6c.lr, cux1_degs.weihan.6c.lr))

print(' ----- 3C, NN')

print(t.test(neg_ctrl.3c.nn, most_var.3c.nn))
print(t.test(neg_ctrl.3c.nn, mouse_tf.3c.nn))
print(t.test(neg_ctrl.3c.nn, cux1.jeff.3c.nn))
print(t.test(neg_ctrl.3c.nn, cux1.jeff_molly.3c.nn))
print(t.test(neg_ctrl.3c.nn, cux1.jeff_weihan.3c.nn))
print(t.test(neg_ctrl.3c.nn, cux1_degs.molly.3c.nn))
print(t.test(neg_ctrl.3c.nn, cux1_degs.weihan.3c.nn))

print(' ----- 6C, NN')

print(t.test(neg_ctrl.6c.nn, most_var.6c.nn))
print(t.test(neg_ctrl.6c.nn, mouse_tf.6c.nn))
print(t.test(neg_ctrl.6c.nn, cux1.jeff.6c.nn))
print(t.test(neg_ctrl.6c.nn, cux1.jeff_molly.6c.nn))
print(t.test(neg_ctrl.6c.nn, cux1.jeff_weihan.6c.nn))
print(t.test(neg_ctrl.6c.nn, cux1_degs.molly.6c.nn))
print(t.test(neg_ctrl.6c.nn, cux1_degs.weihan.6c.nn))



print('\n\n\n\n1,000 Most Var & Experimental Datasets')
print(' ----- 3C, LR')

print(t.test(most_var.3c.lr, cux1.jeff.3c.lr))
print(t.test(most_var.3c.lr, cux1.jeff_molly.3c.lr))
print(t.test(most_var.3c.lr, cux1.jeff_weihan.3c.lr))
print(t.test(most_var.3c.lr, cux1_degs.molly.3c.lr))
print(t.test(most_var.3c.lr, cux1_degs.weihan.3c.lr))

print(' ----- 6C, LR')

print(t.test(most_var.6c.lr, cux1.jeff.6c.lr))
print(t.test(most_var.6c.lr, cux1.jeff_molly.6c.lr))
print(t.test(most_var.6c.lr, cux1.jeff_weihan.6c.lr))
print(t.test(most_var.6c.lr, cux1_degs.molly.6c.lr))
print(t.test(most_var.6c.lr, cux1_degs.weihan.6c.lr))

print(' ----- 3C, NN')

print(t.test(most_var.3c.nn, cux1.jeff.3c.nn))
print(t.test(most_var.3c.nn, cux1.jeff_molly.3c.nn))
print(t.test(most_var.3c.nn, cux1.jeff_weihan.3c.nn))
print(t.test(most_var.3c.nn, cux1_degs.molly.3c.nn))
print(t.test(most_var.3c.nn, cux1_degs.weihan.3c.nn))

print(' ----- 6C, NN')

print(t.test(most_var.6c.nn, cux1.jeff.6c.nn))
print(t.test(most_var.6c.nn, cux1.jeff_molly.6c.nn))
print(t.test(most_var.6c.nn, cux1.jeff_weihan.6c.nn))
print(t.test(most_var.6c.nn, cux1_degs.molly.6c.nn))
print(t.test(most_var.6c.nn, cux1_degs.weihan.6c.nn))



print('\n\n\n\nMouse TFs & Experimental Datasets')
print(' ----- 3C, LR')

print(t.test(mouse_tf.3c.lr, cux1.jeff.3c.lr))
print(t.test(mouse_tf.3c.lr, cux1.jeff_molly.3c.lr))
print(t.test(mouse_tf.3c.lr, cux1.jeff_weihan.3c.lr))
print(t.test(mouse_tf.3c.lr, cux1_degs.molly.3c.lr))
print(t.test(mouse_tf.3c.lr, cux1_degs.weihan.3c.lr))

print(' ----- 6C, LR')

print(t.test(mouse_tf.6c.lr, cux1.jeff.6c.lr))
print(t.test(mouse_tf.6c.lr, cux1.jeff_molly.6c.lr))
print(t.test(mouse_tf.6c.lr, cux1.jeff_weihan.6c.lr))
print(t.test(mouse_tf.6c.lr, cux1_degs.molly.6c.lr))
print(t.test(mouse_tf.6c.lr, cux1_degs.weihan.6c.lr))

print(' ----- 3C, NN')

print(t.test(mouse_tf.3c.nn, cux1.jeff.3c.nn))
print(t.test(mouse_tf.3c.nn, cux1.jeff_molly.3c.nn))
print(t.test(mouse_tf.3c.nn, cux1.jeff_weihan.3c.nn))
print(t.test(mouse_tf.3c.nn, cux1_degs.molly.3c.nn))
print(t.test(mouse_tf.3c.nn, cux1_degs.weihan.3c.nn))

print(' ----- 6C, NN')

print(t.test(mouse_tf.6c.nn, cux1.jeff.6c.nn))
print(t.test(mouse_tf.6c.nn, cux1.jeff_molly.6c.nn))
print(t.test(mouse_tf.6c.nn, cux1.jeff_weihan.6c.nn))
print(t.test(mouse_tf.6c.nn, cux1_degs.molly.6c.nn))
print(t.test(mouse_tf.6c.nn, cux1_degs.weihan.6c.nn))



print('\n\n\n\nCux1 Binding Targets vs Cux1 Binding Intersecting DEGs')

print(t.test(cux1.jeff_molly.3c.lr, cux1_degs.molly.3c.lr))
print(t.test(cux1.jeff_weihan.3c.lr, cux1_degs.weihan.3c.lr))

print(t.test(cux1.jeff_molly.6c.lr, cux1_degs.molly.6c.lr))
print(t.test(cux1.jeff_weihan.6c.lr, cux1_degs.weihan.6c.lr))

print(t.test(cux1.jeff_molly.3c.nn, cux1_degs.molly.3c.nn))
print(t.test(cux1.jeff_weihan.3c.nn, cux1_degs.weihan.3c.nn))

print(t.test(cux1.jeff_molly.6c.nn, cux1_degs.molly.6c.nn))
print(t.test(cux1.jeff_weihan.6c.nn, cux1_degs.weihan.6c.nn))