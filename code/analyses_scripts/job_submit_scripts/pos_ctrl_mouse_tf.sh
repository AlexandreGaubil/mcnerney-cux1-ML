#!/bin/bash
#SBATCH --job-name=pos_ctrl_mouse_tf_rf_and_gb
#SBATCH --output=pos_ctrl_mouse_tf_rf_and_gb.out
#SBATCH --error=pos_ctrl_mouse_tf_rf_and_gb.err
#SBATCH --time=36:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=14
#SBATCH --mem=64G
#SBATCH --mail-user=alerts@gaubil.me
#SBATCH --mail-type=ALL

module load python

date

python ../analyses/pos_ctrl_mouse_tf.py
