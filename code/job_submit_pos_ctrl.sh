#!/bin/bash
#SBATCH --job-name=1000_degs
#SBATCH --output=new_pos_ctrl_1000_most_var.out
#SBATCH --error=new_pos_ctrl_1000_most_var.err
#SBATCH --time=8:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=14
#SBATCH --mem-per-cpu=200
#SBATCH --mail-user=agaubil@icloud.com
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

module load python

# POS CTRL
python analyses/pos_ctrl_1000_rdm_most_var.py
python analyses/pos_ctrl_mouse_tf.py
