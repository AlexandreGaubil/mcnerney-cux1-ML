#
# Negative control testing using logistic regression over TF List
#
# Use the TF list provided by AnimalTFDB3.0
# (http://bioinfo.life.hust.edu.cn/AnimalTFDB/#!/download)
# and apply logistic regression to it using the same parameters used by
# Weinreb (2020)
#

# ---- LIBRARIES ----

import numpy as np
import pandas as pd
from sklearn.preprocessing import LabelBinarizer
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from tqdm import tqdm
import os

os.chdir(os.path.dirname(os.path.abspath(__file__)))


# ---- MODEL ----

# Construct the model using the same parameters as Weinreb (2020). Some
# parameters had to be changed: solver, multi_class, & max_iter.
lr = LogisticRegression(penalty = 'l2',
                        dual = False,
                        tol = 0.0001,
                        # C = [0.008 in vitro; 0.004 in vivo]
                        C = 0.008,
                        fit_intercept = True,
                        intercept_scaling = 1,
                        class_weight = None,
                        random_state = None,
                        # solver = 'warn',
                        solver = 'saga',
                        # max_iter = 100,
                        max_iter = 1000,
                        # multi_class = 'warn',
                        multi_class = 'multinomial',
                        verbose = 0,
                        warm_start = False,
                        n_jobs = None)


# ---- IMPORT DATA ----

mouse_tf_df = pd.read_csv('./../../data/input/pos_ctrl/pos_ctrl_mus_musculus_TF_animal_TFDB.txt', sep = '\t')

# List of transcriptor factors
tfs = mouse_tf_df['Symbol'].tolist()

data_matrix = pd.read_csv('./../../data/output/pos_control/var_2000_pos_ctrl_data_headers.txt', sep = ' ')
feature_array = np.genfromtxt('./../../data/output/pos_control/var_2000_pos_ctrl_feature.txt', dtype = 'str')

# Keep only genes that are mouse transcription factors
df = data_matrix[data_matrix.columns[data_matrix.columns.isin(tfs)]]

# One-hot encoding of feature_array
lb = LabelBinarizer()
lb.fit(feature_array)
feature_one_hot = lb.transform(feature_array)

# To recover labels from one hot encoding
# lb.inverse_transform(feature_one_hot)


# ---- MODEL & SCORING ----

accuracy_array = []

# Create 50 models of 1000 random genes each and calculate each model's accuracy
for i in tqdm(range(1, 50)):
    x_train, x_test, y_train, y_test = train_test_split(df,
                                                        feature_array,
                                                        test_size=0.25)

    # Fit the model to the data
    model = lr.fit(x_train, y_train)

    # Score the model accuracy
    accuracy_array.append(model.score(x_test, y_test))


# ---- OUTPUT ----

print(accuracy_array)
print("\nAverage accuracy: {}".format(np.mean(accuracy_array)))
print("Standard deviation: {}".format(np.std(accuracy_array)))

# Results for all cell types:
# Average accuracy: 0.590
# Standard deviation: 0.026