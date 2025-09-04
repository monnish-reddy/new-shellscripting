#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then 
    echo "please run the script with root access"
    exit 1 # give other thank 0 upto 127
else
    echo "runnig the script with root user"
fi

dnf install mysql -y



