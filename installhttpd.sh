#!/bin/bash
sudo su
sudo apt update -y
sudo apt install apache2 -y
sudo service apache2 stop
sudo service apache2 start
sudo service apache2 status


#log ------> sudo tail -f /var/log/cloud-init-output.log