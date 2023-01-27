#!/bin/bash
#SBATCH --job-name=prog_3
#SBATCH --output=prog_3_rf_and_gb.out
#SBATCH --error=prog_3_rf_and_gb.err
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
echo 'PROG 3'

python ../analyses/prog_wrapper.py -i 'neu' -i 'mep'
