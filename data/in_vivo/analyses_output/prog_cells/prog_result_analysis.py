# WARNING: Before running this script to compile results, search the output file
# for the following regular expression:
# `MODEL --- GridSearchCV((.|\n)*?)Starting run of that model with.*`
# and remove all matches.

# python prog_result_analysis.py > prog_f1_analysis_python_res.txt



import numpy as np
import re
import os

from sklearn import model_selection

__location__ = os.path.realpath(os.path.join(os.getcwd(), os.path.dirname(__file__)))
f = open (os.path.join(__location__,'prog_3_f1.out') , 'r')



def summary_of_results(local_results, model_print):
    print(local_results)
    summary = local_results

    for data_file in local_results.keys():
        for cell in local_results[data_file].keys():
            local_array = np.array(local_results[data_file][cell], dtype = np.single)
            summary[data_file][cell] = {'avg': np.mean(local_array), 'std': np.std(local_array)}


    print("\nSUMMARY")
    print(model_print)
    print(summary)
    print("\n\n\n\n")




# List of words indicating a line to ignore
ignore_list = [
    "precision",
    "accuracy",
    "macro avg",
    "weighted avg",
    "solver",
    "Average",
    "Standard",
    "Accuracy array",
    "Warning: Unable",
    "POS CTRL PROG GENES",
    "CST 2022"]

# Results dictionary
results = {}
model_for_results = ""

data_file = ""

# Iterate though all the lines and analyse them one by one
for original_line in f:
    line = original_line.strip()
    # Line describing the model
    if ("LogisticRegression" in line) or ("MLPClassifier" in line):
        if (results != {}):
            summary_of_results(results, model_for_results)
            results = {}
        print("Model: {}".format(line))
        model_for_results = line

    elif bool([ele for ele in ignore_list if(ele in line)]):
        pass

    elif ("Data file" in line):
        print(line)

    # Line containing the name of the datafile
    elif (".csv" in line) or (".txt" in line):
        data_file = line
        if not(line in results):
            results[data_file] = {}

    elif (line == ""):
        pass

    # Is part of a table
    else:
        #print(line)
        re_res = re.findall('\"(.*?)\"', line) or "ERROR"
        if (re_res == "ERROR"):
            print("\n\n\n\nERROR READING LINE:")
            print(line)
        cell = re_res[0]
        f1_score = re.findall("(?:\d+(?:\.\d*)?|\.\d+)", line)[2]

        if not(cell in results[data_file]):
           results[data_file][cell] = [f1_score]
        else:
            results[data_file][cell].append(f1_score)

summary_of_results(results, model_for_results)