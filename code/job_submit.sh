#!/bin/bash
#SBATCH --job-name=cux1
#SBATCH --output=cux1.out
#SBATCH --error=cux1.err
#SBATCH --time=24:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=14
#SBATCH --mem-per-cpu=2000

module load python

# NEG CTRL
# python neg_ctrl/neg_ctrl_1000_rdm.py

# HYPER-PARAM TUNING DNN
python cux1/cux1.py
