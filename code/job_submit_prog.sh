#!/bin/bash
#SBATCH --job-name=prog
#SBATCH --output=new_prog.out
#SBATCH --error=new_prog.err
#SBATCH --time=25:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=14
#SBATCH --mem-per-cpu=200
#SBATCH --mail-user=agaubil@icloud.com
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

module load python

# POS CTRL
python analyses/pos_ctrl_prog.py