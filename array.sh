#!/bin/bash

#-----it will store multiple values

BOOKS=("SCIENTIFIC" "DRAMA" "LOVE STORY" "ROMANTIC" "HORROR" "THRILLER")

echo "TRACK1 is: ${BOOKS[0]}"   #--- i need first book

#----- i need all the books

echo "ALL TRACKS are: ${BOOKS[%]}"
