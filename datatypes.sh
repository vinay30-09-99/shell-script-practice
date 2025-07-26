#!/bin/bash

#------ i need to add 2 numbers with timestamp

NUM1=$1
NUM2=$2

TOTAL=$NUM1+$NUM2
TIMESTAMP=$(DATE)

echo "sum of NUM1 and NUM2 is: $TOTAL"

