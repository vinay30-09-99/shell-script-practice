#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: please run with root access"
    exit 1
else
    echo "now you are in root acess"
fi

#-- function takes the repeated things
#-- here, the below commenting steps are repeating
#-- i will repeated as one

#if [ $? -eq 0 ]
#then
#    echo "Installing MYSQL.... SUCCESS"
#else
#    echo "Installing MYSQL.... FAILURE"
#fi

VALIDATE()
{
    if [ $1 -eq 0 ]       #-- why means $1 -ne 0 --> install $2 
    #(inplace of $2 -- mysql, pyhotn3,nginx,...)
    then
        echo "Installing $2.... SUCCESS"
    else
        echo "Installing $2.... FAILURE"
    fi
} 

dnf list installed mysql
if [ $? -ne 0 ]          
then
    echo "MYSQL is not installed... need to install it"
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo "MYSQL is already installed....."
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed... need to install it"
    dnf install python3 -y
    VALIDATE $? "python3"
else  
    echo "python3 already installed....."
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo "nginx is not installed... need to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx already installed....."
fi
