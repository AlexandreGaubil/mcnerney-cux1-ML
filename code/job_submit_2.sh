#!/bin/bash
#SBATCH --job-name=DEGs_lr
#SBATCH --output=DEGs_lr.out
#SBATCH --error=DEGs_lr.err
#SBATCH --time=5:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=14
#SBATCH --mem-per-cpu=200
#SBATCH --mail-user=gaubil@uchicago.edu
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

module load python

# NEG CTRL
# python neg_ctrl/neg_ctrl_1000_rdm.py

# POS CTRL
# python pos_ctrl/pos_ctrl_1000_rdm_most_var.py
# python pos_ctrl/pos_ctrl_mouse_tf.py

# HYPER-PARAM TUNING DNN
# python cux1/cux1.py
python cux1/DEGs.py
