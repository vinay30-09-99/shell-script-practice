#!/bin/bash

USERID=$(id -u)        #root userid always 0

if [ $USERID -ne 0 ]            
then
    echo "ERROR:: please run with root access" 
    exit 1       #--- here, it execute manually (other than 0 -- 1 to 127)  --- 0 -- success exit status, 1to 127 -- failure exit status
else
    echo "now you are in root access"
fi

dnf list installed mysql
#-- to check mysql is installed or not, if installed $? is 0
#-- if not installed $? is not 0

if [ $? -ne 0 ]
then 
    echo "MYSQL is not installed....need to install it"
    if [ $? -eq 0 ]        #---- here, $?
    then 
        echo "Installing MYSQL.....SUCCESS"
    else
        echo "Installing MYSQL.....FAILURE"
        exit 1
    fi
else
    echo "Already installed...."
fi