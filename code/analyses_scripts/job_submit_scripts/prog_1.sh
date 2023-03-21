#!/bin/bash
#SBATCH --job-name=prog_1
#SBATCH --output=prog_1_rf_and_gb.out
#SBATCH --error=prog_1_rf_and_gb.err
#SBATCH --time=36:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=14
#SBATCH --mem=64G
#SBATCH --mail-user=alerts@gaubil.me
#SBATCH --mail-type=ALL

module load python

date
echo 'PROG 1'

python ../analyses/prog_wrapper.py -i 'dc' -i 'mo_dc' -i 'mo_neu'
