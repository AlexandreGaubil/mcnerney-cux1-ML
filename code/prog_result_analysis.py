from unittest import result
import pandas as pd
import numpy as np
import re
import os

__location__ = os.path.realpath(os.path.join(os.getcwd(), os.path.dirname(__file__)))
f = open (os.path.join(__location__,'pos_ctrl_prog_nn.out') , 'r')

# List of words indicating a line to ignore
ignore_list = ["precision", "accuracy", "macro avg", "weighted avg", "solver", "Average", "Standard"]

# Results dictionary
results = {}

data_file = ""

# Iterate though all the lines and analyse them one by one
for original_line in f:
    line = original_line.strip()
    # Line describing the model
    if ("LogisticRegression" in line) or ("MLPClassifier" in line):
        print("Model: {}".format(line))

    # Line containing the name of the datafile
    elif (".csv" in line):
        data_file = line
        if not(line in results):
            results[data_file] = {}

    elif (line == ""):
        print("Empty line")

    elif bool([ele for ele in ignore_list if(ele in line)]):
        print("Ignore this line")

    # Is part of a table
    else:
        cell = re.findall('\"(.*?)\"', line)[0]
        f1_score = re.findall("(?:\d+(?:\.\d*)?|\.\d+)", line)[2]

        if not(cell in results[data_file]):
           results[data_file][cell] = [f1_score]
        else:
            results[data_file][cell].append(f1_score)

print(results)
summary = results

for data_file in results.keys():
    for cell in results[data_file].keys():
        local_array = np.array(results[data_file][cell], dtype = np.single)
        summary[data_file][cell] = {'avg': np.mean(local_array), 'std': np.std(local_array)}


print("\n\n\n\n\nSUMMARY\n\n")
print(summary)