#!/bin/bash
# This script tests all projects/01/*.hdl chips in batch
# Author: Maksim Yegorov <findmaksim@gmail.com>
# Last edit: 2015-10-05 Mon 10:25 PM

for filename in ./*.tst; do
    file=${filename##*/}
    base=${file%.*}
    printf "\n"; echo $base.tst
    ../../../tools/HardwareSimulator.sh $base.tst
done
