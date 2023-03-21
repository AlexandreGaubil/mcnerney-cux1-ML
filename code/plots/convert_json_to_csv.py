import os
import json
import csv

f = open('prog_gene_analysis.json', 'r')
data = json.load(f)

fw = open('prog_gene_analysis_result.csv', 'a')

for model_name in data:
    for gene_file_name in data[model_name]:
        for cell_type in data[model_name][gene_file_name]:
            for value in data[model_name][gene_file_name][cell_type]:
                fw.write(model_name +','+ gene_file_name +','+ cell_type +','+ str(value) + '\n')