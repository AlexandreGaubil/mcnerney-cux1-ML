# Results Overview

## Negative Control (`neg_ctrl/`)

### 1,000 Random Genes (`neg_ctrl_1000_rdm.py`)

#### Linear Regression

**Results for 3 cell types:**
Average accuracy: 0.633
Standard deviation: 0.032

**Results for 6 cell types with `max_iter = 500` (11 failures to converge):**
Average accuracy: 0.562
Standard deviation: 0.030

**Results for 6 cell types with `max_iter = 1,000`:**
Average accuracy: 0.566
Standard deviation: 0.030

**Results for all cell types with `max_iter = 1,000`:**
Average accuracy: 0.498
Standard deviation: 0.026

#### Neural Network

**Results for 6 cell types with neural network (p_mdl):**
Average accuracy: 0.529
Standard deviation: 0.036
Had 27 errors where lbfgs failed to converge on 500

**Results for 6 cell types with neural network (model):**
Average accuracy: 0.551
Standard deviation: 0.029
Had 27 errors where lbfgs failed to converge on 500


## Positive Control (`pos_ctrl/`)

### Most Variable Genes (`pos_ctrl_1000_rdm_most_var.py`)

**Results for 6 cell types with all genes:**
Average accuracy: 0.737

**Results for 6 cell types with random 1,000 genes:**
Average accuracy: 0.711
Standard deviation: 0.014


### Mouse Transcription Factors (`pos_ctrl_mouse_tf.py`)

**Results for all cell types:**
Average accuracy: 0.618
Standard deviation: 0.022

### Progenitor Gene Sets (`pos_ctrl_prog.py`)

See `pos_ctrl_prog_result.txt`.




## Cux1 Gene Sets (`cux1/cux1_jeff_molly_weihan.py`)


### Cux1 Biding sites by Jeff Kurkewich

**Results for all cell types:**
Average accuracy: 0.672
Standard deviation: 0.023


### Cux1 Biding sites by Jeff Kurkewich x DEGs after Cux1 KD by Molly Imgruet

**Results for all cell types:**
Average accuracy: 0.667
Standard deviation: 0.026


### Cux1 Biding sites by Jeff Kurkewich x DEGs after Cux1 KD by Weihan Liu

**Results for all cell types:**
Average accuracy: 0.690
Standard deviation: 0.027