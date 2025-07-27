#!/bin/bash

USERID=$(id -u)

if[ $USERID -eq 0 ]
then 
    echo "already in  root access"
else
    echo "ERROR:: please run with root access"
fi
