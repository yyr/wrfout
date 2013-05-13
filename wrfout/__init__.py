#!/usr/bin/env python
"""
WRFOUT module
"""

import util
import conf
import logging
import Nio

__all__ = [ 'util','conf']

def plot_vars(filename):
    fh = Nio.open_file(filename,mode="r",format='nc')
    var_groups = util.var_grouped(fh)
    for k in var_groups.keys():
        print(k+": ")
        for v in var_groups[k]:
            print(v)

def arg_parse(plot2d,log_file=None,in_file=None,log=None,log_level=None):
    LOG_FORMAT = '%(levelname)-8s: %(message)s'
    formatter = logging.Formatter(LOG_FORMAT)

    ch = logging.StreamHandler()
    ch.setFormatter(formatter)
    lgr = logging.getLogger('wrfout')
    lgr.addHandler(ch)
    lgr.setLevel('INFO')

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
        lgr.info('set "%s" as input file' % in_file)

    plot_vars(in_file)   # plot variables.


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
