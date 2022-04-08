#!/bin/bash
#SBATCH --job-name=human_f1
#SBATCH --output=human_f1.out
#SBATCH --error=human_f1.err
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
python ../analyses/human.py