#This script id for installing Prometheus on linux ubuntu
#Created: Thurs June 27, 2024 8:30 WAT
#Created by: Paul Mosi
#Modified:



#Download Prometheus compress file to be unpacked

sudo wget https://github.com/prometheus/prometheus/releases/download/v2.45.6/prometheus-2.45.6.linux-amd64.tar.gz

#List Directory

ls
 
#Output: prometheus-2.45.6.linux-amd64.tar.gz

#Install tar.gz

sudo apt install tar.gz 


#Create a system group

sudo groupadd --system prometheus

#Cretae a no login user

sudo useradd -s /sbin/nologin --system -g promethues prometheus

#Make directories

sudo mkdir -p /var/lib/prometheus
sudo mkdir -p /etc/prometheus
sudo mkdir -p /etc/prometheus/rules.s
sudo mkdir -p /etc/prometheus/files_d

#Unpack Prometheus

sudo tar -xzf prometheus-2.45.6.linux-amd64.tar.gz


#List directory

ls

#Output: prometheus-2.45.6.linux-amd64  prometheus-2.45.6.linux-amd64.tar.gz

#Change directory

cd prometheus-2.45.6.linux-amd64/

#List directory

ls
#Output: LICENSE  NOTICE  console_libraries  consoles  prometheus  prometheus.yml  promtool


#Move prometheus and promtool to directories were they should sit so linux can recognize the commands

sudo mv prometheus promtool /usr/local/bin

#Also move prome prometheus.yml consoles console_libraries to /etc/prometheus/ directory created

Sudo mv prometheus.yml consoles console_libraries /etc/prometheus/

#Change directory

cd ~

#Change ownership

sudo chown -R prometheus:prometheus /etc/prometheus/
sudo chown -R prometheus:prometheus /etc/prometheus/*
sudo chown -R prometheus:prometheus /var/lib/prometheus/
sudo chown -R prometheus:prometheus /var/lib/prometheus/*
#chown: cannot access '/var/lib/prometheus/*': No such file or directory


#Change permissions 

sudo chmod -R 775 /etc/prometheus
sudo chmod -R 775 /etc/prometheus/*


#Create a service file to start prometheus automatically when server restarts

sudo vi /etc/systemd/system

sudo vi /etc/systemd/system/prometheus.service 

#Reload systemctl

sudo systemctl daemon-reload

#Start prometheus

sudo systemctl start prometheus 

#Enable prometheus

sudo systemctl enable prometheus







#Install a Node Exporter using the url below on application server.
#https://www.prometheus.io/downlaod/#node_exporter

#Extract the content from the compressed file

#Create a system group on the application server
#sudo groupadd --system prometheus

#Create a no login user
#sudo useradd -s /sbin/nologin --system -g prometheus prometheus

#Make a directory called node
#sudo mkdir -p /var/lib/node

#Navigate to the directory node exporter directory
#cd /node_exporter.xxx

#Move node_exporter to the node directory created earlier
#sudo mv node_exporter /var/lib/node

#Change directory 
#cd ~

#Change ownership of the directory
#sudo chown -R prometheus:prometheus /var/lib/node
#sudo chown -R prometheus:prometheus /var/lib/node/*
#sudo chmod -R 775 /var/lib/node
#sudo chmod -R 775 /var/lib/node/*

#Create a system service to restart 
#sudo vi /etc/systemd/system/node_service

#Reload system daemon
#sudo systemctl daemon-reload 

#Start node
#suod systemctl start node

#Enable node
#systemctl enable node

#Check the status and port to access node exporter
#sudo netstat -lnpt








#Update packages and installing Grafana

#sudo apt update
#sudo apt-get install -y adduser libfontconfig1 musl
#wget https://dl.grafana.com/enterprise/release/grafana-enterprise_11.1.0_amd64.deb
#sudo dpkg -i grafana-enterprise_11.1.0_amd64.deb

#Reload Daemon

#sudo systemctl daemon-reload
  
#Enable Grafana

#sudo /bin/systemctl enable grafana-server

#Start Grafana

#sudo /bin/systemctl start grafana-server




