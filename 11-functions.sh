#!/bin/bash

USER=$(id -u)
if [ $USER -eq 0 ]
then
    echo "ERROR:: Please run the script with ROOT USER"
    exit 1
else
    echo "You ar runnig script with ROOT USER"
fi
VALIDATE(){
    if [ $1 -eq 0]
    then
        echo " Installing $2 is ...SUCCESS"
    else
        echo "ERROR:: Installing $2 is ...FAILURE"
        exit 1
}
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not installed going to install"
    dnf install mysql -y
    VALIDATE $? "mysql"
