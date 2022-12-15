docker run -d -p 8081:8081 --name nexus sonatype/nexus3

##########################################
#To get the Admin password
#docker container exec nexus cat /nexus-data/admin.password

####################################################################################*

<<COMMENT
#!/bin/bash
sudo apt update -y
sudo apt install openjdk-8-jre-headless -y
sudo java -version
sleep 5
sudo apt-get install wget
cd /home/ubuntu/
wget https://download.sonatype.com/nexus/3/nexus-3.44.0-01-unix.tar.gz
tar -xvf nexus-3.44.0-01-unix.tar.gz
./nexus-3.44.0-01/bin/nexus start #( starts the nexus artifactory )
./nexus-3.44.0-01/bin/nexus status #( by this you check the status of nexus artifactory )

COMMENT

#To access this use http://ip_Address:8081 ( by deafault which will be running on 8081)
#intial password will be present in /opt/sonatype-work/nexus3/admin.password


#log ------> sudo tail -f /var/log/cloud-init-output.log
#sudo update-alternatives --config java