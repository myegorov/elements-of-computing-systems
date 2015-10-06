#!/bin/bash
# This script tests all projects/01/*.hdl chips in batch
# Author: Maksim Yegorov <findmaksim@gmail.com>
# Last edit: 2015-10-05 Mon 10:04 PM

for filename in ./*.hdl; do
    basename=$filename
    basename=${basename%.*}
    printf "\n"; echo $basename 
    ../../tools/HardwareSimulator.sh $basename.tst
done
