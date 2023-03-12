#!/bin/bash
###############################
# Author: Kumar
# Date: 02-Dec-2019
#
# Version: V1
#
# This script will download all the required softwares on Ubuntu VM and configure AWS CLI
################################

AWS_ACCESS_KEY_ID=""
AWS_ACCESS_KEY_SECRET=""
AWS_REGION="us-east-1"
#$user = ""

#Installing the unzip
sudo apt-get install unzip

#Update the Mahine
sudo apt update -y

#Install Aws CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
sudo aws --Version   #displays aws version

#Configure aws cli
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID; aws configure set aws_secret_access_key $AWS_ACCESS_KEY_SECRET; aws configure set default.region $AWS_REGION

#
