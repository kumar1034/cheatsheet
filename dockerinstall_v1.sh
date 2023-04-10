#!/bin/bash

########
#
# Author: Kumar
#
########

# Installation Command which works for Ubuntu OS
# `curl https://raw.githubusercontent.com/kumar1034/cheatsheet/main/dockerinstall_v1.sh | sudo bash`

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG=docker-install.log
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
	echo  -e "$R You are not the root user, you dont have permissions to run this $N"
	exit 1
fi

VALIDATE(){
	if [ $1 -ne 0 ]; then
		echo -e "$2 ... $R FAILED $N"
		exit 1
	else
		echo -e "$2 ... $G SUCCESS $N"
	fi

}

apt-get update  -y &>>$LOG
VALIDATE $? "Updating packages"

apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y &>>$LOG
VALIDATE $? "Installing Docker"

service docker start &>>$LOG
VALIDATE $? "Starting Docker"

systemctl enable docker &>>$LOG
VALIDATE $? "Enabling Docker"

usermod -a -G docker ubuntu &>>$LOG
VALIDATE $? "Added ubuntu to docker group"

apt-install git -y &>>$LOG
VALIDATE $? "Installing GIT"

curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose &>>$LOG
VALIDATE $? "Downloaded docker-compose"

chmod +x /usr/local/bin/docker-compose
VALIDATE $? "Moved docker-compose to local bin"

echo  -e "$R You need logout and login to the server $N"
