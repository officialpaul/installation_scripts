#!/bin/bash

#This scripts copies and deploys multiple OS web servers to remote hosts.
#Created: Thurs June 27, 2024 8:30 WAT
#Created by: Paul Mosi
#Modified:


#Declaring Variables

user="paul"

for host in `cat remhost` 

do

echo "###########################"
echo " Connecting to remote hosts"
echo "###########################"
echo
echo "###############################"
echo "Pushing scripts to remote hosts"
echo "###############################"
scp /home/paul/multios_web_setup.sh $user@$host:/temp_files/
echo
echo "#################################"
echo "Executing scripts on remote hosts"
echo "#################################"
ssh $user@$host sudo ./multios_web_setup.sh
echo
echo "###########################"
echo "Cleaning Up Temporary Files"
echo "###########################"
echo 
ssh $user@$host sudo rm -rf /home/paul/temp_files/multios_web_setup.sh


done
