#!/bin/bash

LOGS_FOLDER="/var/log/shell-script-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

echo "Script started executing at: $TIMESTAMP" &>>LOG_FILE_NAME

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to perfom this action"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2...FAILURE"
        exit 1
    else
        echo "$2....SUCCESS"
    fi
} 

dnf list installed mysql &>>LOG_FILE_NAME
if [ $? -ne 0 ]   #### NOT INSTALLED
then
    dnf install mysql -y
    VALIDATE $? "Installing MYSQL"
else
    echo "MY SQL...already installed"

fi


dnf list installed git &>>LOG_FILE_NAME
if [ $? -ne 0 ]   #### NOT INSTALLED
then
    dnf install git -y
    VALIDATE $? "Installing GIT"
else
    echo "MY SQL...already installed"
fi