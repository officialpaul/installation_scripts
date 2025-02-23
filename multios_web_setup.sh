#!/bin/bash

#Project:
#========

#Deploy 10 EC2 Instances on AWS. One Ubuntu as the Master and the remaining 9 as target hosts [A mix of Ubuntu and AWS Linux]
#Change the Hostname for each of the VM's and map their hostnames to an IP address.
#SSH Into each EC2 using their hostnames, create a user on each VM, and add the user to the visudo file with a NOPASSWD option. 
#For the Ubuntu VM, edit the sshd_config file to allow Password authentication. NB: Do the same for the Amazon Linux 2023 VM.
#Generate an SSH Key on the Master VM and copy it to the target hosts.
#Download the scripts here: https://github.com/paul0581/web-deployment/tree/master/scripts and deploy the scripts on the target hosts from the Master VM.

#Created: Thurs June 27, 2024 8:30 WAT
#Created by: Paul Mosi
#Modified:



#Variable Declaration
URL='https://www.tooplate.com/zip-templates/2093_flight.zip'
ART_NAME='2093_flight'
TEMPDIR="/tmp/webfiles"

yum --help > /dev/null

if [ $? -eq 0 ]

then

#Set Variables For Cent OS
PACKAGE="httpd wget unzip"
SVC="httpd"

echo "Running Variables For Cent OS"
# Installing Dependencies
echo
echo "####################"
echo "Installing Packages"
echo  "###################"
echo
sudo yum install $PACKAGE -y >> /dev/null 

#Start and Enable services
echo
echo "################################"
echo "Starting & Enable HTTPD Services"
echo "################################"
echo 
systemctl start $SVC
systemctl enable $SVC
echo
# Creating Temp Directory
echo
echo "####################"
echo "Creating TEMP Folder"
echo "####################"
echo 
mkdir -p $TEMPDIR
cd $TEMPDIR
echo
echo "###########"
echo "Install ART"
echo "###########"
echo
wget $URL >> /dev/null
unzip $ART_NAME.zip >> /dev/null
sudo cp -r $ART_NAME/* /var/www/html
echo

#Restarting HTTPD
echo
echo "########################"
echo "Restarting HTTPD Service"
echo "########################"
echo
systemctl restart $SVC
echo

#Clean Up
echo
echo "########################"
echo "Removing Temporary Files"
echo "########################"
echo 
rm -rf $TEMPDIR
echo
echo "#####################"
echo "Checking HTTPD Status"
echo "#####################"
echo
sudo systemctl status $SVC | grep Active
ls /var/www/html/
echo

else

#Set Variables For Ubuntu OS
PACKAGE="apache2 wget unzip"
SVC="apache2"

echo "Running Variables For Ubuntu OS"
# Installing Dependencies
echo
echo "####################"
echo "Installing Packages"
echo  "###################"
echo
sudo apt install $PACKAGE -y >> /dev/null

#Start and Enable services
echo
echo "##################################"
echo "Starting & Enable Apache2 Services"
echo "##################################"
echo 
systemctl start $SVC
systemctl enable $SVC
echo
# Creating Temp Directory
echo
echo "####################"
echo "Creating TEMP Folder"
echo "####################"
echo 
mkdir -p $TEMPDIR
cd $TEMPDIR
echo
echo "###########"
echo "Install ART"
echo "###########"
echo
wget $URL >> /dev/null
unzip $ART_NAME.zip >> /dev/null
sudo cp -r $ART_NAME/* /var/www/html
echo

#Restarting HTTPD
echo
echo "##########################"
echo "Restarting Apache2 Service"
echo "##########################"
echo
systemctl restart $SVC
echo

#Clean Up
echo
echo "########################"
echo "Removing Temporary Files"
echo "########################"
echo 
rm -rf $TEMPDIR
echo
echo "#######################"
echo "Checking Apache2 Status"
echo "#######################"
echo
sudo systemctl status $SVC | grep Active
ls /var/www/html/
echo

fi