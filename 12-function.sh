#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
      echo "$2 is ....FAILED"
    else
       echo "$2 is ....SUCCESS" 
    fi
}

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
  VALIDATE $? "Installing Git"
 else
     echo "Git is alredy installed, nothing to do"  
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo " mysql is not installed , go ing to install"
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "Mysql alredy installed"    
fi      

