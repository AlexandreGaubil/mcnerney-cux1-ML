#
# Logistic Regression
#
# Description
#


# ---- LIBRARIES ----

from sklearn.linear_model import LogisticRegression


# ---- MODEL ----

# Construct the model using the same parameters as Weinreb (2020). Some
# parameters had to be changed: solver, multi_class, & max_iter.
model = LogisticRegression(penalty = 'l2',
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