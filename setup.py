from distutils.core import setup

import wrfout

setup(
    name='wrfout',
    version=wrfout.VERSION,
    author=wrfout.AUTHOR,
    packages=['wrfout'],
    author_email='hi@yagnesh.org',
    url='https://github.com/yyr/wrfout',
    license=wrfout.LICENSE,
    description='Library to plot & analyze WRF output.',
    long_description=wrfout.__doc__,
    keywords='wrf, wrfout, weather',
    classifiers=[
        "Programming Language :: Python :: 2.7",
        "Intended Audience :: Science/Research",
        "Topic :: Scientific/Engineering :: Science",
    ],
)
