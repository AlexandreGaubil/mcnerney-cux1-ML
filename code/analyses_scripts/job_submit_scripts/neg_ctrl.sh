#!/bin/bash
#SBATCH --job-name=neg_ctrl_rf_and_gb
#SBATCH --output=neg_ctrl_rf_and_gb.out
#SBATCH --error=neg_ctrl_rf_and_gb.err
#SBATCH --time=36:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=6
#SBATCH --ntasks-per-node=14
#SBATCH --mem=64G
#SBATCH --mail-user=alerts@gaubil.me
#SBATCH --mail-type=ALL

module load python

date

python ../analyses/neg_ctrl_1000_rdm.py
