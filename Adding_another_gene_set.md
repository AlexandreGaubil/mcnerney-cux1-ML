# Doing an analysis with another gene set

Here are all the steps to run this job on a new gene set and a desired model. The core steps are: 
- define which gene set to use,
- define which models to use,
- create the script that runs the models on the gene sets,
- submit the job.

## Define the gene sets to use

Add a file with all those genes in the folder `data/gene_sets/RUNX1.txt`. Each line in the file should be an individual gene.
Add the path of the file with the genes of interest to the file `code/analyses_scripts/file_strings.py`, by adding the following code snippet:
```python
GOI_RUNX1 = './../../../data/gene_sets/RUNX1.txt'
```

In the file `code/analyses_scripts/default_variables.py`, add the following line to define the set of genes we are interested in:
```python
goi_runx1 = [st.GOI_RUNX1]
```


## Define a new analysis to run

Create a new file in `code/analyses_scripts/analyses/` named `runx1.py`, with the following content:
```python
import os
import sys
sys.path.insert(1, os.path.join(sys.path[0], '..'))
os.chdir(os.path.dirname(os.path.abspath(__file__)))
import run_model as run
import default_variables as df

print("\n\n\nRUNX1")
run.run_model(
    df.models,
    df.goi_runx1,
    df.data_files,
    df.data_col_seps,
    df.features_files,
    df.n_models,
    df.hyper_param_tuning,
    df.submodel,
    False,
    df.f1_score,
    df.print_coeffs)
```

## Define which models should be run on this gene set

Modify the file `code/analyses_scripts/default_variables.py` to define exactly which models should be run on this gene set. The parameters of interest are as follows:
```python
# NOTE ON LENGTH OF ARRAYS
# For all the arrays, there are two possible lengths:
# - `model_list`, `n_models`, `hyper_param_tuning`, and `print_coeffs` must all have the same length.
# - `data_mtx_files`, `data_mtx_col_seps`, and `features_array_files` must all have the same length.

# All the following arrays should have the same length. They define which models to use.
# Option 1: Neural network only
models = [md.neural_network]
submodel = [md._neural_network_model]
n_models = [10]
hyper_param_tuning = [True]
print_coeffs = [False]
# Option 2: Random forest and gradient boosting
# models = [md.random_forest, md.gradient_boosting]
# submodel = [md._random_forest_model, md._gradient_boosting_model]
# n_models = [10, 10]
# hyper_param_tuning = [True, True]
# print_coeffs = [False, False]
# Option 3: Logistic regression and neural network
# models = [md.log_reg, md.neural_network]
# submodel = [None, md._neural_network_model]
# n_models = [50, 1]
# hyper_param_tuning = [False, True]
# print_coeffs = [False, False]

# All the following arrays should have the same length. They define on which datasets to run the analysis.
# The next three lines say to run the model on both the set of the three most frequent cells and all the cells.
data_files = [st.THREE_CELLS_ALL_GENES_DATA, st.ALL_CELLS_ALL_GENES_DATA]
features_files = [st.THREE_CELLS_ALL_GENES_FEATURES, st.ALL_CELLS_ALL_GENES_FEATURES]
data_col_seps = [' ', ' ']
# The next three lines say to run the model on only the set of all the cells.
# data_files = [st.ALL_CELLS_ALL_GENES_DATA]
# features_files = [st.ALL_CELLS_ALL_GENES_FEATURES]
# data_col_seps = [' ']

# Specifies if all models should calculate f1 score instead of accuracy.
f1_score = True
```

To resume the above:
- The parameter `models` defines which models should be run on the gene set (i.e., the neural network, random forest, gradient boosting or logistic regression). Theses models are defined in the file `code/analyses_scripts/models.py`.
- The parameter `submodel` indicates if there is a submodel for the corresponding model defined in `models` (i.e., `_random_forest_model` for `random_forest`, 
`_gradient_boosting_model` for `gradient_boosting`, `_neural_network_model` for `neural_network`, and `None` for `log_reg`).
- The parameter `n_models` indicates how many times we should should generate a model for each model (to take the average of them to have more accurate results).
- The parameter `hyper_param_tuning` indicates if we should do hyper parameter tunning of the model or not (we are for each model that has a submodel defined in `submodels`).
- The parameter `print_coeffs` indicates if we should print the coefficients of the selected model if we are doing hyper parameter tunning. _N.B.:_ I commented out the code in `run_model.py` that actually prints it out, since it's not useful for what we are doing, but you can put it back in if you want (if you're having issues with that, I can help you put it back in if you need).
- The parameter `data_files` indicated which cell data we should use (either the set with only the three most frequent cell types or the set of all cells).
- The parameter `features_files` is the same as above, but instead of pointing to the files that contain the gene levels, they point to the files with the cells' features.
- The parameter `data_col_seps` is the character used to separate columns in both of the above files. It's a whitespace for both, so you shouldn't need to change this parameter.
- The parameter `f1_score` indicates if we should use an f1 scoring method or a simple average. I think we settled on f1 scores, so you can probably just leave this as-is.

## Run the model

Create a new file in `code/analyses_scripts/job_submit_scripts` named `runx1.sh` with the following content:
```bash
#!/bin/bash
#SBATCH --job-name=runx1
#SBATCH --output=runx1.out
#SBATCH --error=runx1.err
#SBATCH --time=36:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=14
#SBATCH --mem=64G

# You might not need the following, depending on where you run this.
module load python/anaconda-2021.05
source activate /project2/mcnerney/gaubil/mcnerney-cux1-ML/env
# conda env create --prefix=/home/gaubil/env/lab -f labenv.yml

date

python ../analyses/runx1.py
```

Then, you can submit it as a job. This should return to you a file `runx1.out` with the results.

## Analyse the results

In the results file, you will get the different results, including the average accuracy / f1 score, the standard deviation, and the individual results of each model run (to be able to calculate p-values). In the directory `code/plots/`, I have a few R scripts to generate the graphs we have that you can use as inspiration (although you might have some that you want to use instead).
