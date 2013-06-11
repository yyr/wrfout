'''
WRFOUT helper functions.
'''

import os
import fnmatch
import logging


def _get_logger():
    LOG_FORMAT = '%(levelname)-8s: %(message)s'
    logger = logging.getLogger('wrfout')
    logger.setLevel(logging.INFO)
    if not logger.handlers:
        hlr = logging.StreamHandler()
        hlr.setFormatter(logging.Formatter(LOG_FORMAT))
        logger.addHandler(hlr)
    return logger


def find_inputfile(dom=3):
    """Search for files starts with wrfout_d0. If more than one file, chooses
    depend on the domain number.

    :type dom: int
    :rtype: str
    """
    for f in os.listdir('.'):
        if fnmatch.fnmatch(f, 'wrfout_d0' + str(dom) + '*'):
            return f
        else:
            continue
    return None


def var_list(fh):
    return fh.variables.keys()


def print_var_summary(fh, varname=None):
    if varname is not None:
        try:
            print(fh.variables[varname])
        except KeyError:
            print('\nWARNING: no such variable called "%s"; listing all vars'
                  % varname)
            print('  ' + '\n  '.join(fh.variables.keys()))
    else:
        print('No variable is given listing all vars  ' +
              '\n  '.join(fh.variables.keys()))


def var_grouped(fh, by_type="dimension"):
    if by_type == "dimension":
        o_d = t_d = th_d = f_d = []
        for var in var_list(fh):
            v = fh.variables[var]
            if v.rank == 1:
                o_d.append(var)
            elif v.rank == 2:
                t_d.append(var)
            elif v.rank == 3:
                th_d.append(var)
            elif v.rank == 4:
                f_d.append(var)
    return {'1d': o_d, '2d': t_d, '3d': th_d, '4d': f_d}


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

if __name__ == '__main__':
    pass
