from . import util
import Nio
import Ngl


lgr = util._get_logger()


def _get_wks(wks_name, wks_type='ps'):
    wkres = Ngl.Resources()
    wkres.wkColorMap = "default"
    return Ngl.open_wks(wks_type, wks_name, wkres)


def draw_2d(varname, v):
    res = Ngl.Resources()
    plot_name = 'wo_%s' % varname.lower()
    lgr.info('plot name set to - %s' % plot_name)
    wks = _get_wks(plot_name)
    for t in range(3):
        plot = Ngl.contour(wks, v[t,:,:], res)


class wrfout(object):
    """Base class of wrfout file. """
    def __init__(self, filename, format='nc'):
        self._filename = filename
        self._fh = Nio.open_file(filename, mode="r", format=format)
        self._var_list = self.var_list()
         # for a in self._fh.__dict__.keys():
        #     setattr(self, a, getattr(self._fh, a))

    def var_list(self):
        return self._fh.variables.keys()

    def var_grouped(self, by_type="dimension"):
        if by_type == "dimension":
            self._1d = self._2d = self._3d = self._4d = []
            for var in self._var_list:
                v = self.variables[var]
                if v.rank == 1:
                    self.o_d.append(var)
                elif v.rank == 2:
                    self.t_d.append(var)
                elif v.rank == 3:
                    self.th_d.append(var)
                elif v.rank == 4:
                    self.f_d.append(var)

    def rank(self, varname):
        return self._fh.variables[varname].rank

    def value(self, varname):
        return self._fh.variables[varname].get_value()

    def plot_var(self, varname):
        lgr.info('Started plotting - %s' % varname)
        if self.rank(varname) == 3:
            pltr = Plotter(varname, self.value(varname), '')
            pltr.hplot()


class Plotter(object):
    """Base Plotter class"""
    def __init__(self, varname, var, plot_type, along='time'):
        self.varname = varname
        self.var = var
        self.plot_type = plot_type
        self.along = along

    def hplot(self, along='time'):
        if along == 'time':
            draw_2d(self.varname, self.var)
