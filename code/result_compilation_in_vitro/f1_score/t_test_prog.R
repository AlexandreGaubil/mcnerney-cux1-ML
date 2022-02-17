source('data_prog.R')
library(stats)

print('\n\n\n\nProgenitor Genes')

print(t.test(prog.neu.3c.lr.ba, prog.neu.3c.lr.neu))
print(t.test(prog.neu.3c.nn.ba, prog.neu.3c.nn.neu))
print('')
print(t.test(prog.ba.3c.lr.ba, prog.ba.3c.lr.neu))
print(t.test(prog.ba.3c.nn.ba, prog.ba.3c.nn.neu))