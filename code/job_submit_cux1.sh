#!/bin/bash
#SBATCH --job-name=cux1
#SBATCH --output=new_cux1_and_degs_nn.out
#SBATCH --error=new_cux1_and_degs_nn.err
#SBATCH --time=20:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=14
#SBATCH --mem-per-cpu=200
#SBATCH --mail-user=agaubil@icloud.com
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

module load python

# HYPER-PARAM TUNING DNN
python analyses/cux1.py
python analyses/DEGs.py
