#!/usr/bin/python

import sys, getopt
import os
import pos_ctrl_prog as prog


def main(argv):
	sys.path.insert(1, os.path.join(sys.path[0], '..'))
	os.chdir(os.path.dirname(os.path.abspath(__file__)))

	import default_variables as df

	try:
		opts, args = getopt.getopt(argv,"hi:",["ifile="])
	except getopt.GetoptError:
		print('Should be called as `prog_wrapper.py -i <inputfile>`')
		sys.exit(2)
	for opt, arg in opts:
		if (arg == 'ba'):
			prog.run_prog(df.goi_prog_ba)
		elif (arg == 'b'):
			prog.run_prog(df.goi_prog_b)
		elif (arg == 'pre_b'):
			prog.run_prog(df.goi_prog_pre_b)
		elif (arg == 'dc'):
			prog.run_prog(df.goi_prog_dc)
		elif (arg == 'mo_dc'):
			prog.run_prog(df.goi_prog_mo_dc)
		elif (arg == 'mo_neu'):
			prog.run_prog(df.goi_prog_mo_neu)
		elif (arg == 'neu'):
			prog.run_prog(df.goi_prog_neu)
		elif (arg == 'hsc'):
			prog.run_prog(df.goi_prog_hsc)
		elif (arg == 'mep'):
			prog.run_prog(df.goi_prog_mep)
		else:
			print("ERROR: Unknown parameter `{}` passed to prog_wrapper.py".format(opt))


if __name__ == "__main__":
   main(sys.argv[1:])