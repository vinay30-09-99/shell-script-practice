#!/bin/bash

#-----it will store multiple values

BOOKS=("SCIENTIFIC" "DRAMA" "LOVE STORY" "ROMANTIC" "HORROR" "THRILLER")

echo "TRACK1 is: ${BOOKS[0]}"   #--- i need to print first book


echo "ALL TRACKS are: ${BOOKS[@]}"    #----- i need to print all the books
