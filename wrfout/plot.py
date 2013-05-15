'''
Plotting routines.
'''

from .util import *
import Nio

def plot_vars(filename):
    fh = Nio.open_file(filename,mode="r",format='nc')
    var_groups = var_grouped(fh)
    for k in var_groups.keys():
        print(k+": ")
        for v in var_groups[k]:
            print(v)


if __name__ == '__main__':
    main()
