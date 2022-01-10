#!/bin/bash
#SBATCH --job-name=cux1
#SBATCH --output=neg_ctrl_nn.out
#SBATCH --error=neg_ctrl_nn.err
#SBATCH --time=3:00:00
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
python pos_ctrl/pos_ctrl_1000_rdm_most_var.py

# HYPER-PARAM TUNING DNN
# python cux1/cux1.py
