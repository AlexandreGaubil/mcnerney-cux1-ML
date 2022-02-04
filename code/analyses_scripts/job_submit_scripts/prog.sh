#!/bin/bash
#SBATCH --job-name=prog_f1
#SBATCH --output=prog_f1.out
#SBATCH --error=prog_f1.err
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
python ../analyses/pos_ctrl_prog.py
