#!/bin/bash

sudo su
sudo apt update -y
sudo apt install openjdk-11-jre-headless -y
sudo java -version
sleep 5
sudo apt-get update -y
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-key fingerprint 0EBFCD88
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo docker run hello-world
sudo chmod 777 /var/run/docker.sock


#log ------> sudo tail -f /var/log/cloud-init-output.log
