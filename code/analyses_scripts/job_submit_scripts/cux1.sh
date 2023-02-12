#!/bin/bash
#SBATCH --job-name=cux1
#SBATCH --output=cux1_rf_and_gb.out
#SBATCH --error=cux1_rf_and_gb.err
#SBATCH --time=36:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=14
#SBATCH --mem=64G
#SBATCH --mail-user=alerts@gaubil.me
#SBATCH --mail-type=ALL

module load python/anaconda-2021.05
source activate /project2/mcnerney/gaubil/mcnerney-cux1-ML/env
# conda env create --prefix=/home/gaubil/env/lab -f labenv.yml

date

python ../analyses/cux1.py
