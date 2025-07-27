#!/bin/bash

USERID=$(id -u)

if[ $USERID -ne 0 ]
    echo "ERROR:: please run with root access"
else
    echo "already in  root access"
fi
