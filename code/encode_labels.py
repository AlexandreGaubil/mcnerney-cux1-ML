#
# Logistic Regression
#
# Description
#


# ---- LIBRARIES ----
import numpy as np
from sklearn.preprocessing import LabelBinarizer


# ---- LABEL ENCODING ----

# Returns a one-hot encoded feature array from the given file
def encode_labels(features_file_path):
    feature_array = np.genfromtxt(features_file_path, dtype = 'str')
    lb = LabelBinarizer()
    lb.fit(feature_array)
    return lb.transform(feature_array)

# To recover labels from one hot encoding
# lb.inverse_transform(feature_one_hot)