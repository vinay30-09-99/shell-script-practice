#!/bin/bash

USERID=$(id -u)

if[ $USERID -eq 0 ]
then 
    echo "ERROR:: please run with root access"
else
    echo "already in  root access"
fi
