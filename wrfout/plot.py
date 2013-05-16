'''
Plotting routines.
'''

import util
import Nio
from .conf import config

PLOTVARS = ['HGT']
lgr = util._get_logger()


def plot_var(var, fh):
    lgr.info('Started plotting %s:' % var)
    print(var, fh)


def _plot_vars(filename):
    fh = Nio.open_file(filename, mode="r", format='nc')
    for var in [v for v in PLOTVARS if v in util.var_list(fh)]:
        plot_var(var, fh)

if __name__ == '__main__':
    pass
