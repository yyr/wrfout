'''
Plotting routines.
'''

from . import util
import Nio
import Ngl

PLOTVARS = ['HGT']
lgr = util._get_logger()


def ntimes(v):
    tname = 'Time' if 'Time' in v.dimensions else 'time'
    try:
        tid = v.dimensions.index(tname)
        return v.shape[tid]
    except ValueError:
        tid = v.dimensions.index('t')
        return v.shape[tid]
    except:
        return None


def _get_wks(wks_name, wks_type='ps'):
    wkres = Ngl.Resources()
    wkres.wkColorMap = "default"
    return Ngl.open_wks(wks_type, wks_name, wkres)


def draw_2d(v,varname):
    res = Ngl.Resources()
    plot_name = 'wo_%s' % varname.lower()
    print(plot_name)
    wks = _get_wks(plot_name)
    for t in range(3):
        plot = Ngl.contour(wks,v[t,:,:],res)


def hplot(varname, fh, along='time'):
    if along == 'time':
        v = fh.variables[varname].get_value()
        draw_2d(v,varname)

def plot_var(varname, fh):
    lgr.info('Started plotting - %s' % varname)
    if util.rankof(varname, fh=fh) == 3:
        hplot(varname, fh=fh, along='time')


def _plot_vars(filename):
    fh = Nio.open_file(filename, mode="r", format='nc')
    for varname in [v for v in PLOTVARS if v in util.var_list(fh)]:
        plot_var(varname, fh)

if __name__ == '__main__':
    pass
