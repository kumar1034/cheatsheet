#!/bin/bash
sudo su
sudo apt update -y
sudo apt install openjdk-11-jre-headless -y
sudo java -version
sleep 5
sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update -y
sleep 5
sudo apt-get install jenkins -y
sudo sleep 5
sudo systemctl start jenkins
sleep 5
systemctl status jenkins

