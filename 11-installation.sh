#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]

then
  echo "Please run this script root priveleges"
  exit 1
fi  
   
dnf list installed git

if [ $? -ne 0 ]  
then 
  echo "Git is not installed, going to install it .."
  dnf install git -y

 else
     echo "Git is alredy installed, nothing to do"  
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo " mysql is not installed , go ing to install"
    dnf install mysql -y
    if [ $? -ne 0]
    then
       echo "MySql installation is failure.. Please check"
        exit 1
    else
       echo "MySql installation is success"   
    fi 
else
    echo "Mysql alredy installed"      

