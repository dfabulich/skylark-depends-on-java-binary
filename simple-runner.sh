#!/bin/bash -eux
START_DIR=`pwd`
OUTPUT=$1
if [ "${OUTPUT:0:1}" != "/" ]; then
        OUTPUT=$START_DIR/$1
fi
cd ${BASH_SOURCE[0]}.runfiles
./my-other-runner > $OUTPUT
