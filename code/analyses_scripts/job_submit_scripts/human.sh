#!/bin/bash
#SBATCH --job-name=human_rf_and_gb
#SBATCH --output=human_rf_and_gb.out
#SBATCH --error=human_rf_and_gb.err
#SBATCH --time=36:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=14
#SBATCH --mem-per-cpu=200
#SBATCH --mail-user=agaubil@icloud.com
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

module load python

date

python ../analyses/human.py
