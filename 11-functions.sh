#!/bin/bash

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

dnf list installed mysql
if [ $? -ne 0 ]   #### NOT INSTALLED
then
    dnf install mysql -y
    VALIDATE $? "Installing MYSQL"
else
    echo "MY SQL...already installed"

fi


dnf list installed git
if [ $? -ne 0 ]   #### NOT INSTALLED
then
    dnf install git -y
    VALIDATE $? "Installing GIT"
else
    echo "MY SQL...already installed"
fi