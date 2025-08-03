#!/bin/bash

#here, i am adding colors
R="\e[31m"  #31--RED
G="\e[32m"  #32--GREEN
M="\e[35m"  #35--MAGENTA
N="\e[0m"   #means, no color

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python3" "nginx" "httpd")

mkdir -p $LOGS_FOLDER
echo "script started executing at: $(date)" | tee -a $LOG_FILE

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: $N please run with root access" | tee -a $LOG_FILE
    exit 1
else
    echo -e "$G now you are in root acess $N" | tee -a $LOG_FILE
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
        echo -e "Installing $2....$G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "Installing $2....$R FAILURE $N" | tee -a $LOG_FILE
    fi
} 

for package in ${PACKAGES[@]}   #--- this is for in code you give the package names
do
  dnf installed $package &>>$LOG_FILE
if [ $? -ne 0 ]          
then
    echo "$package is not installed... need to install it" | tee -a $LOG_FILE
    dnf install $package -y &>>$LOG_FILE
    VALIDATE $? "$package"        #-- validate $?=0 --> install MYSQL.... SUCCESS
else
    echo -e "$M $package is already installed..... $N" | tee -a $LOG_FILE
fi
