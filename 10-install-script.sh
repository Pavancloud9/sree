#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to perfom this action"
    exit 1
fi

dnf install mysql -y
if [ $? -ne 0 ]
then
    echo "MY SQL Installation...FAILURE"
    exit 1
else
    echo "MY SQL Installation....SUCCESS"
fi