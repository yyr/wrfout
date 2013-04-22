#!/bin/bash
# Created: Tuesday, January 22 2013

for dir in `cat ./modelout_dir`; do
    cd $dir
    echo RUNNING NCL IN: $dir
    ncl $@                          # eg ./run_ncl.sh foo.ncl
done
