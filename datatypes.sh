#!/bin/bash

#------ i need to add 2 numbers with timestamp

NUM1=$1
NUM2=$2

TIMESTAMP=$(date)   #---- here, date is by default built in linux

echo "script executed at: $TIMESTAMP"

TOTAL=$((NUM1+NUM2))

echo "sum of $NUM1 and $NUM2 is: $TOTAL"

