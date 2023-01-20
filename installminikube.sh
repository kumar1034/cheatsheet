#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y 
sudo apt-get install curl 
sudo apt-get install apt-transport-https
sudo apt install conntrack 
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
ls -l var/run/docker.sock
sudo usermod -aG docker $USER && newgrp docker 
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/minikube
minikube version 
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo mv kubectl /usr/local/bin/kubectl
sudo chmod +x /usr/local/bin/kubectl
kubectl version --client

minikube start --force
minikube status
kubectl cluster-info
kubectl config view
minikube delete


minikube addons list
minikube addons enable ingress
