#!/bin/bash
#SBATCH --job-name=degs
#SBATCH --output=degs_rf_and_gb.out
#SBATCH --error=degs_rf_and_gb.err
#SBATCH --time=36:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=14
#SBATCH --mem=64G
#SBATCH --mail-user=alerts@gaubil.me
#SBATCH --mail-type=ALL

module load python/anaconda-2021.05

date

python ../analyses/DEGs.py

