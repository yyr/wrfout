'''
WRFOUT helper functions
'''

import os
import fnmatch
import sys

import Nio

def find_inputfile(dom=3):
    for f in os.listdir('.'):
        if fnmatch.fnmatch(f, 'wrfout*' + 'd0' + str(dom) + '*'):
            return f
        else:
            return None

def print_var_summary(fh,varname=None):
    if varname is not None:
        try:
            print(fh.variables[varname])
        except KeyError:
            print('\nWARNING: no such variable called "%s"; listing all vars' % varname)
            print('  ' + '\n  '.join(fh.variables.keys()))
    else:
        print('No variable is given listing all vars  ' +
              '\n  '.join(fh.variables.keys()))

if __name__ == '__main__':
    pass
