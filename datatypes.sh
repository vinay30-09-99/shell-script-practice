#!/bin/bash

#------ i need to add 2 numbers with timestamp

NUM1=100
NUM2=200
TIMESTAMP=$(date)
TOTAL=$NUM1+$NUM2

echo "script executed at: $TIMESTAMP"
echo "sum of $NUM1 and $NUM2 is: $TOTAL"

