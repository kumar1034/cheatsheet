#!/bin/bash

sudo su
sudo apt update -y
sudo apt install openjdk-11-jre-headless -y
sudo java -version
sleep 5
sudo apt-get install wget
sudo wget https://download.sonatype.com/nexus/3/nexus-3.44.0-01-unix.tar.gz
sudo tar -xvf nexus-3.44.0-01-unix.tar.gz
sudo cd nexus-3.44.0-01/bin
./nexus start #( starts the nexus artifactory )
./nexus status #( by this you check the status of nexus artifactory )


#To access this use http://ip_Address:8081 ( by deafault which will be running on 8081)
#intial password will be present in /opt/sonatype-work/nexus3/admin.password

#log ------> sudo tail -f /var/log/cloud-init-output.log