# Results Overview

## Negative Control (`neg_ctrl/`)

### 1,000 Random Genes (`neg_ctrl_1000_rdm.py`)

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



## Positive Control (`pos_ctrl/`)

### Most Variable Genes (`pos_ctrl_1000_rdm_most_var.py`)

**Results for 6 cell types with all genes:**
Average accuracy: 0.737

**Results for 6 cell types with random 1,000 genes:**
Average accuracy: 0.711
Standard deviation: 0.014


### Mouse Transcription Factors (`pos_ctrl_mouse_tf.py`)

**Results for all cell types:**
Average accuracy: 0.590
Standard deviation: 0.026