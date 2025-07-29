#!/bin/bash

#here, i am adding colors
R=\e[31m  #31--RED
G=\e[32m  #32--GREEN
M=\e[35m  #35--MAGENTA
N=\e[0m    #means, no color

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: $N please run with root access"
    exit 1
else
    echo -e "$G now you are in root acess $N"
fi

#-- above code is for checking root access is there or not
#-- function takes the repeated things
#-- here, the below commenting steps are repeating
#-- i will repeated as one

#if [ $? -eq 0 ]
#then
#    echo "Installing MYSQL.... SUCCESS"
#else
#    echo "Installing MYSQL.... FAILURE"
#fi

VALIDATE()          #-- this is function(it is repeated)
{
    if [ $1 -eq 0 ]       #-- why means $1 -eq 0 (0==0)--> 
    #install $2 
    #(inplace of $2 -- mysql, pyhotn3,nginx,...)
    then
        echo -e "Installing $2....$G SUCCESS $N"
    else
        echo -e "Installing $2....$R FAILURE $N"
    fi
} 

dnf list installed mysql
if [ $? -ne 0 ]          
then
    echo "MYSQL is not installed... need to install it"
    dnf install mysql -y
    VALIDATE $? "mysql"        #-- validate $?=0 --> install MYSQL.... SUCCESS
else
    echo -e "$M MYSQL is already installed..... $N"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed... need to install it"
    dnf install python3 -y
    VALIDATE $? "python3"
else  
    echo -e "$M python3 already installed..... $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo "nginx is not installed... need to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "$M nginx already installed..... $N"
fi
