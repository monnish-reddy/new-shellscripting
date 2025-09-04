#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then 
    echo "please run the script with root access"
    exit 1 # give other thank 0 upto 127
else
    echo "runnig the script with root user"
fi
dnf list installed mysql
if [ $? -ne 0]
then 
    echo "mysql is not installed going to insatlla"
else
    echo "mysql is already present "
    exit 1
fi

dnf install mysql -y
if [ $? -eq 0 ]
then  
    echo "installing mysql is success"
else
    echo "installing mysql is failure"
    exit 1
fi



