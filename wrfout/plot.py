'''
Plotting routines.
'''

from . import util
from .core import wrfout

PLOTVARS = ['HGT']
lgr = util._get_logger()


def _plot_vars(filename):
    out = wrfout(filename)
    for varname in [v for v in PLOTVARS if v in out._var_list]:
        out.plot_var(varname)

if __name__ == '__main__':
    pass
