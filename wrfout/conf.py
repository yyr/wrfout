#!/usr/bin/env python
# -*- coding: utf-8; -*-

'''
Configuration data for plots.
'''

from .py3compat import utf8
import ConfigParser
import io

default_config = utf8("""
[HGT]
title = Terrain Height
prefix = hgt
max =
min =
units =
scale =


[SST]
title = SST
prefix = sst
max =
min =
units =
scale =

[T2]
prefix = t2
title = Temp at 2m
max =
min =
units =
scale =

[PSFC]
prefix = psfc
title = sfc pressure
max =
min =
units =
scale =

[LANDMASK]
prefix = landmask
title = Land mask
max =
min =
units =
scale =

[SEAICE]
prefix = seaice
title = Sea Ice flag
max =
min =
units =
scale =

[SNOWC]
prefix = snowc
title = Snow cover
max =
min =
units =
scale =

[VEGFRA]
prefix = vegfra
title = Vegitation
max =
min =
units =
scale =

[PBLH]
prefix = pblh
title = PHL Height
max =
min =
units =
scale =

[SNOWH]
prefix = snowh
title = Snow depth
max =
min =
units =
scale =

[TH2]
prefix = th2
title = Pot temp at 2m
max =
min =
units =
scale =

[TMN]
prefix = tmn
title = Soil temp
max =
min =
units =
scale =

[TSK]
prefix = tsk
title = Sur skin temp
max =
min =
units =
scale =

[RAINC]
prefix = ranic
title = Cumulus prec
max =
min =
units =
scale =

[QFX]
prefix = qfx
title = Moist flux(up)
max =
min =
units =
scale =


[OLR]
prefix = olr
title = l/w (out)
max =
min =
units =
scale =

[SWDOWN]
prefix = swdown
title = s/w (down)
max =
min =
units =
scale =

[HFX]
prefix = hfx
title = Heat flux(up)
max =
min =
units =
scale =
""")


class ConfParser(ConfigParser.RawConfigParser):
    def read_string(self, string):
        s = io.StringIO(string)
        return self.readfp(s)

config = ConfParser()
config.read_string(default_config)


# vars to be plotted.
class varConf(object):
    """Variable configuration
    """
    def __init__(self):
        self.known_vars = []

    def _var_conf(self, varname):
        pass

    def var_conf(self, varname):
        if varname in self.known_vars:
            return self._var_conf(varname)
        else:
            return None

if __name__ == '__main__':
    pass
