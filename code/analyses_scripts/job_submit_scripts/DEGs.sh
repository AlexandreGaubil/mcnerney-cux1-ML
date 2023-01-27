#!/bin/bash
#SBATCH --job-name=degs
#SBATCH --output=degs_rf_and_gb.out
#SBATCH --error=degs_rf_and_gb.err
#SBATCH --time=48:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=14
#SBATCH --mem-per-cpu=200
#SBATCH --mail-user=agaubil@icloud.com
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

module load python

date

python ../analyses/DEGs.py

