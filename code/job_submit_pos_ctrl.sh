#!/bin/bash
#SBATCH --job-name=1000_degs_mouse_tf_t_test
#SBATCH --output=1000_degs_mouse_tf_t_test.out
#SBATCH --error=1000_degs_mouse_tf_t_test.err
#SBATCH --time=25:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=14
#SBATCH --mem-per-cpu=200
#SBATCH --mail-user=agaubil@icloud.com
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

module load python

date

# POS CTRL
python analyses/pos_ctrl_1000_rdm_most_var.py
python analyses/pos_ctrl_mouse_tf.py