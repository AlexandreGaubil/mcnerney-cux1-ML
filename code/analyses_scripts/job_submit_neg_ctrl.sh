#!/bin/bash
#SBATCH --job-name=neg_ctrl_t_test
#SBATCH --output=neg_ctrl_t_test.out
#SBATCH --error=neg_ctrl_t_test.err
#SBATCH --time=10:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=14
#SBATCH --mem-per-cpu=200
#SBATCH --mail-user=agaubil@icloud.com
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

module load python

date

# NEG CTRL
python analyses/neg_ctrl_1000_rdm.py