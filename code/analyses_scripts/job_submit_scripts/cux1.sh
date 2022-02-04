#!/bin/bash
#SBATCH --job-name=cux1_f1
#SBATCH --output=cux1_f1.out
#SBATCH --error=cux1_f1.err
#SBATCH --time=20:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=14
#SBATCH --mem-per-cpu=200
#SBATCH --mail-user=agaubil@icloud.com
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

module load python

date

# HYPER-PARAM TUNING DNN
python ../analyses/cux1.py
python ../analyses/DEGs.py
