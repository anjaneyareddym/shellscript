#!/bin/bash

USERID=$(id -u) #
LOGS_FOLDER="var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) #$0 file name
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e"$R Please run this script with root priveleges $N" &>>$LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R FAILED $N"&>>$LOG_FILE
        exit 1
    else
        echo -e "$2 is... $G SUCCESS $N"&>>$LOG_FILE
    fi
}
USAGE(){
   echo  -e " $R USAGE $N: sudo sh 16.redirect.sh package1 package 2 "
   exit 1
}
echo "Script started executed :$(date)"
CHECK_ROOT
if [ $# -eq 0 ] 
then
   USAGE
fi   
for package in $@
do
  dnf list installed $package &>>$LOG_FILE
  if [ $? -ne 0 ]
  then
    echo -e " $package is not installed ,$R go ing to install it . $N" &>>$LOG_FILE
    dnf install $package -y
    VALIDATE $? "Installing $package"
  else
    echo  -e "$package is already installed. $Y nothing to do $N" &>>$LOG_FILE
  fi  
done