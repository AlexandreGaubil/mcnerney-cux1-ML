#!/bin/bash
#SBATCH --job-name=neg_ctrl
#SBATCH --output=new_neg_ctrl_nn.out
#SBATCH --error=new_neg_ctrl_nn.err
#SBATCH --time=10:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=14
#SBATCH --mem-per-cpu=200
#SBATCH --mail-user=agaubil@icloud.com
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

module load python

# NEG CTRL
python analyses/neg_ctrl_1000_rdm.py
