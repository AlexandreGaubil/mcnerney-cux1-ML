#
# Negative control testing using logistic regression.
#
# Use 50 random pools of 1,000 genes each and apply logistic regression to it
# using the same parameters used by Weinreb (2020)
#

# Should get ~40% prediction accuracy

from sklearn.linear_model import LogisticRegression

# ----- Construct the model using the same parameters as Weinreb (2020) ----
lr = LogisticRegression(penalty = 'l2',
                        dual = False,
                        tol = 0.0001,
                        # C = [0.008 in vitro; 0.004 in vivo]
                        C = 0.008,
                        fit_intercept = True,
                        intercept_scaling = 1,
                        class_weight = None,
                        random_state = None,
                        solver = 'warn',
                        max_iter = 100,
                        multi_class = 'warn',
                        verbose = 0,
                        warm_start = False,
                        n_jobs = None)


# ---- Import the data ----


# ---- Fit the model to the data ----

# result = lr.fit(data)


# ---- Score the model accuracy ----

# result.predict_proba(X[:2, :])
# result.score(X, y)