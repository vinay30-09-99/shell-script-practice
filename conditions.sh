#!/bin/bash

# greater than    -gt
# less than       -lt
# equal           -eq
# not equal       -ne


NUM=$1

if [ $NUM -lt 10 ]
then
    echo "$NUM is less than 10"
else
    echo "$NUM is greater than 10"
fi
