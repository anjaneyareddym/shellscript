#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
G="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
      echo -e "$2 is ....$R FAILED $N"
    else
       echo -e "$2 is ....$G SUCCESS $N
       
       
       
       
       
       
       
       " 
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

