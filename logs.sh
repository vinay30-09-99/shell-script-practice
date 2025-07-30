#!/bin/bash

#here, i am adding colors
R="\e[31m"  #31--RED
G="\e[32m"  #32--GREEN
M="\e[35m"  #35--MAGENTA
N="\e[0m"   #means, no color

LOGS_FOLDER="/var/log/shell-script-practice-logs"
SCRIPT_NAME=$(echo $0 | cut -d "," -f1)
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script started executing at: $(date)" &>>$LOGS_FILE

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: $N please run with root access" &>>$LOGS_FILE
    exit 1
else
    echo -e "$G now you are in root acess $N" &>>$LOGS_FILE
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
        echo -e "Installing $2....$G SUCCESS $N" &>>$LOGS_FILE
    else
        echo -e "Installing $2....$R FAILURE $N" &>>$LOGS_FILE
    fi
} 

dnf list installed mysql &>>$LOGS_FILE
if [ $? -ne 0 ]          
then
    echo "MYSQL is not installed... need to install it" &>>$LOGS_FILE
    dnf install mysql -y &>>$LOGS_FILE
    VALIDATE $? "mysql"        #-- validate $?=0 --> install MYSQL.... SUCCESS
else
    echo -e "$M MYSQL is already installed..... $N" &>>$LOGS_FILE
fi

dnf list installed python3 &>>$LOGS_FILE
if [ $? -ne 0 ]
then
    echo "python3 is not installed... need to install it" &>>$LOGS_FILE
    dnf install python3 -y &>>$LOGS_FILE
    VALIDATE $? "python3"
else  
    echo -e "$M python3 already installed..... $N" &>>$LOGS_FILE
fi

dnf list installed nginx &>>$LOGS_FILE
if [ $? -ne 0 ]
then 
    echo "nginx is not installed... need to install it" &>>$LOGS_FILE
    dnf install nginx -y &>>$LOGS_FILE
    VALIDATE $? "nginx"
else
    echo -e "$M nginx already installed..... $N" &>>$LOGS_FILE
fi
