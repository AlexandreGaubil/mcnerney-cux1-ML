#
# Deep Neural Network implementation.
#
# Use 50 random pools of 1,000 genes each taken from 2,000 most variable genes
# and apply logistic regression to it using the same parameters used by
# Weinreb (2020)
#

# -------------- LIBRARIES --------------

import numpy as np
import pandas as pd
import tensorflow as tf
from tensorflow import keras
from sklearn.model_selection import train_test_split

#sklearn.neural_network.MLPClassifier(hidden_layer_sizes=[(100, 20) in vitro; (200,20) in vivo], activation=’relu’, solver=’adam’, alpha=[0.72 in vitro; 10 in vivo], batch_size=’auto’, learning_rate=’constant’, learning_rate_init=0.001, power_t=0.5, max_iter=200, shuffle=True, random_state=None, tol=0.0001, verbose=False, warm_start=False, momentum=0.9, nesterovs_momentum=True, early_stopping=False, validation_fraction=0.1, beta_1=0.9, beta_2=0.999, epsilon=1e-08)


# -------------- IMPORT DATA --------------

data_matrix = np.loadtxt('./data/output/pos_control/var_2000_pos_ctrl_data.txt')
feature_array = np.genfromtxt('./data/output/pos_control/var_2000_pos_ctrl_feature.txt',
                              dtype = 'str')

df = pd.DataFrame(data_matrix)

x_train_x, x_test_x, y_train_x, y_test_x = train_test_split(df,
                                                            feature_array,
                                                            test_size=0.2,
                                                            random_state=0)

x_train = x_train_x.to_numpy()
y_train = y_train_x.to_numpy()
x_test = x_test_x.to_numpy()
y_test = y_test_x.to_numpy()

# -------------- BUILD MODEL ---------------

model = tf.keras.models.Sequential([
  tf.keras.layers.Flatten(input_shape=(2000,)),
  tf.keras.layers.Dense(128, activation='relu'),
  tf.keras.layers.Dropout(0.2),
  tf.keras.layers.Dense(10)
])

predictions = model(x_train[:1]).numpy()
predictions
tf.nn.softmax(predictions).numpy()

loss_fn = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True)
loss_fn(y_train[:1], predictions).numpy()

model.compile(optimizer='adam',
              loss=loss_fn,
              metrics=['accuracy'])




# -------------- TRAIN MODEL --------------

model.fit(x_train, y_train, epochs=5)

eval_res = model.evaluate(x_test,  y_test, verbose=2)
print("model.evaluate = {}".format(eval_res))

probability_model = tf.keras.Sequential([
  model,
  tf.keras.layers.Softmax()
])

probability_model(x_test[:5])







# Fit the model to the data
# model = lr.fit(x_train, y_train)
# Score the model accuracy
# accuracy_array.append(model.score(x_test, y_test))
# x_train, x_test = x_train / 255.0, x_test / 255.0