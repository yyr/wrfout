#!/bin/bash
# Created: Tuesday, January 22 2013

for dir in `cat ./modelout_dir`; do
    echo $dir
    cd $dir
    file=`ls wrfout*`
    file="${file%\\n}"

    export NCL_FIN=$file
    echo ncl_fin: $NCL_FIN
    ncl $@                          # eg ./run_ncl.sh foo.ncl

done
