#!/bin/bash
#SBATCH --job-name=prog_1
#SBATCH --output=prog_1_f1.out
#SBATCH --error=prog_1_f1.err
#SBATCH --time=30:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=14
#SBATCH --mem-per-cpu=200
#SBATCH --mail-user=agaubil@icloud.com
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

module load python

date
echo 'PROG 1'

# POS CTRL
python ../analyses/prog_wrapper.py -i 'dc' -i 'mo_dc' -i 'mo_neu'