#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]            
then
    echo "ERROR:: please run with root access" 
    exit 1       #--- here, it execute manually (other than 0 -- 1 to 127)  --- 0 -- success exit status, 1to 127 -- failure exit status
else
    echo "now you are in root access"
fi

dnf install mysql -y

if [ $? -eq 0 ]
then 
    echo "Installing MYSQL-----SUCCESS"
else
    echo "Installing MYSQL-----FAILURE"
fi

