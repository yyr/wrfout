#!/bin/bash
#
#    File: gen_tags.sh
# Created: Friday, July 27 2012
#

# Description:

function tag_gen()
{
ctags-exuberant -e -a --verbose=yes  --langdef=ncl \
    --langmap=ncl:.ncl --regex-ncl='/^[[:space:]]*function[[:space:]]+([a-zA-Z0-9_]+)[:blank:]*.*/\1/f,function/' \
    --regex-ncl='/^[[:space:]]*procedure[[:space:]]+([a-zA-Z0-9_]+)[:blank:].*/\1/p,procedure/' `find ${1:-"."} -type f -name "*.ncl"`
}

## delete previously generated one.
rm TAGS

tag_gen "$NCARG_ROOT/lib/ncarg/nclscripts/"
tag_gen "$NCL_LIB"
tag_gen .

# gen_tags.sh ends here
