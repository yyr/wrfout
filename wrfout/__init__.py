#!/usr/bin/env python
# [[[cog import cog; cog.out('"""\n{0}"""'.format(file('./README.rst').read()))]]]
"""
wrfout -- Library to plot & analyze WRF output.
==============================================
wrfout is a library to do common visualizations for WRF model output.
It uses `PyNgl <https://www.pyngl.ucar.edu/index.shtml>`_


License
-------
`wrfout` is licensed under GPL v3 (or later).
"""
# [[[end]]]

AUTHOR = "Yagnesh Raghava Yakkala"
WEBSITE = "http://github.com/yyr/wrfout"
LICENSE = "GPL v3 or later"
VERSION = '0.1dev'

from .util import _get_logger, find_inputfile
from .core import plot_vars
import sys


def arg_parse(var, log_file=None, in_file=None,
              log=None, log_level=None):
    """Parse arguments."""
    lgr = _get_logger()
    if log_level:
        lgr.setLevel(log_level)

    if log_file:
        import logging
        handler = logging.FileHandler(filename=log_file, mode='w')
        handler.setFormatter(logging.Formatter(logging.BASIC_FORMAT))
        if log_level:
            log_level = getattr(logging, log_level.upper())
            handler.setLevel(log_level)

        lgr.addHandler(handler)

    if not in_file:
        lgr.warn('No input file is specified, searching the directory.')
        in_file = find_inputfile()
        if not in_file:
            lgr.error('No wrfout file found, exiting.')
            sys.exit(1)

        lgr.warn('considering "%s" as input file' % in_file)

    if var:
        plot_vars(in_file, var)   # plot variables.


def main(args=None):
    """Set arguments."""
    import argparse
    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawTextHelpFormatter,
        description=__doc__)
    parser.add_argument('--in-file', default=None,
                        help='directories in which wrfout is to be run.')

    parser.add_argument('-l', '--log', action='store_true',
                        help='Log wrfout actions.')

    parser.add_argument('--log-file', help='save wrfout logs to this file.')
    parser.add_argument('--log-level',
                        choices=['CRITICAL', 'ERROR', 'WARN', 'INFO', 'DEBUG'],
                        help='logging level for log file.')

    parser.add_argument('var', nargs='+',
                        help='Plots variables which have proper configuration.')


    arg_parse(**vars(parser.parse_args(args)))

if __name__ == '__main__':
    main()
