#!/bin/bash
#SBATCH --job-name=r_in_vivo
#SBATCH --output=r_in_vivo.out
#SBATCH --error=r_in_vivo.err
#SBATCH --time=8:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=14
#SBATCH --mem-per-cpu=200
#SBATCH --mail-user=gaubil@uchicago.edu
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

module load r

r ML_invivo_scFate_in_vivo.Rmd