#!/usr/bin/env python
"""
WRFOUT module
"""

from . import util
from .conf import config
from .plot import _get_logger, _plot_vars

import conf

__all__ = [ 'util','conf', 'plot']

def arg_parse(plot2d,log_file=None,in_file=None,log=None,log_level=None):
    lgr = _get_logger()
    if log_level:
        lgr.setLevel(log_level)

    if log_file:
        handler = logging.FileHandler(filename=log_file, mode='w')
        handler.setFormatter(logging.Formatter(logging.BASIC_FORMAT))
        if log_level:
            log_level = getattr(logging, log_level.upper())
            handler.setLevel(log_level)

        lgr.addHandler(handler)

    if not in_file:
        lgr.warn('No input file is specified, searching the directory.')
        in_file = util.find_inputfile()
        if not in_file:
            lgr.error('No wrfout file found, exiting.')
            sys.exit(1)

        lgr.warn('considering "%s" as input file' % in_file)

    _plot_vars(in_file)   # plot variables.


def main(args=None):
    import argparse
    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawTextHelpFormatter,
        description=__doc__)
    parser.add_argument('--in-file',default=None,
                        help='directories in which wrfout is to be run.')

    parser.add_argument('-l','--log', action='store_true',help='Log wrfout actions.')
    parser.add_argument('--log-file', help='save wrfout logs to this file.')
    parser.add_argument('--log-level',
                        choices=['CRITICAL', 'ERROR', 'WARN', 'INFO', 'DEBUG'],
                        help='logging level for log file.')

    parser.add_argument('plot2d',action='store_true', help='plot 2d variables.')

    arg_parse(**vars(parser.parse_args(args)))

if __name__ == '__main__':
    main()
