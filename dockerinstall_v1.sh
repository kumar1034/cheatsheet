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

#apt-get remove docker docker-engine docker.io containerd runc  &>>$LOG
#VALIDATE $? "Remove Existing Docker Configurations"

apt-get update  -y &>>$LOG
VALIDATE $? "Updating packages"

apt-get install \
    ca-certificates \
    curl \
    gnupg &>>$LOG
VALIDATE $? "Installing packages to allow apt to use a repository over HTTPS"

mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg &>>$LOG
VALIDATE $? "Adding Docker’s official GPG key" &>>$LOG

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null &>>$LOG
VALIDATE $? "Setting up the repository"

apt-get update -y &>>$LOG
VALIDATE $? "Updating packages"

apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y &>>$LOG
VALIDATE $? "Installing Docker"

service docker start &>>$LOG
VALIDATE $? "Starting Docker"

systemctl enable docker &>>$LOG
VALIDATE $? "Enabling Docker"

#usermod -a -G docker rohit &>>$LOG
#VALIDATE $? "Adding rohit to docker group"

apt-install git -y &>>$LOG
VALIDATE $? "Installing GIT"

curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose &>>$LOG
VALIDATE $? "Downloaded docker-compose"

chmod +x /usr/local/bin/docker-compose
VALIDATE $? "Moved docker-compose to local bin"

echo  -e "$R You need logout and login to the server $N"
