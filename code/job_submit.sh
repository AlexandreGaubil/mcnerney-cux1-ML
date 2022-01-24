#!/bin/bash
#SBATCH --job-name=hyper_param_less
#SBATCH --output=further_hyper_param_less.out
#SBATCH --error=further_hyper_param_less.err
#SBATCH --time=36:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=14
#SBATCH --mem-per-cpu=200
#SBATCH --mail-user=agaubil@icloud.com
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

module load python

# NEG CTRL
# python neg_ctrl/neg_ctrl_1000_rdm.py

# POS CTRL
# python pos_ctrl/pos_ctrl_1000_rdm_most_var.py
# python pos_ctrl/pos_ctrl_mouse_tf.py
# python pos_ctrl/pos_ctrl_prog.py

# HYPER-PARAM TUNING DNN
python cux1/cux1.py
# python cux1/DEGs.py
