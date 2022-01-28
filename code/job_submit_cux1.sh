#!/bin/bash
#SBATCH --job-name=cux1
#SBATCH --output=new_cux1_and_degs.out
#SBATCH --error=new_cux1_and_degs.err
#SBATCH --time=20:00:00
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
python cux1/DEGs.py
