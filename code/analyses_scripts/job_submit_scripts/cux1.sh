#!/bin/bash
#SBATCH --job-name=cux1
#SBATCH --output=cux1_rf_and_gb.out
#SBATCH --error=cux1_rf_and_gb.err
#SBATCH --time=36:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=14
#SBATCH --mem-per-cpu=200
#SBATCH --mail-user=automatic@gaubil.me
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

module load python

date

python ../analyses/cux1.py
