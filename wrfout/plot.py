'''
Plotting routines.
'''

from .util import *
import Nio
from .conf import config
import logging

PLOTVARS = ['HGT']

def _get_logger():
    LOG_FORMAT = '%(levelname)-8s: %(message)s'
    logger = logging.getLogger('wrfout')
    logger.setLevel(logging.INFO)
    if not logger.handlers:
        hlr = logging.StreamHandler()
        hlr.setFormatter(logging.Formatter(LOG_FORMAT))
        logger.addHandler(hlr)
    return logger

lgr = _get_logger()


if __name__ == '__main__':
    main()
