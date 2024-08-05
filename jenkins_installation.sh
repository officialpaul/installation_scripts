#! /bin/bash

#This script is for installing Jenkins on Debian/Ubuntu
#Created: Thurs June 27, 2024 8:30 WAT
#Created by: Paul Mosi
#Modified:

#Install plggins: Amazon ECR, Services All, Docker Pipeline
#Install Docker engine, AWS Cli, 
#Create a Jenkins user and add to the docker group with the command below
#Create a AWS credential and add to jenkins
#usermod -aG docker jenkins

#Update packages 
sudo apt update

#Install Java which is a prerequisite to use Jenkins
sudo apt install fontconfig openjdk-17-jre

#Install Jenkins with command as seen on the guide https://www.jenkins.io/doc/book/installing/linux/#debianubuntu
#Ensure port 8080 is opened up as Jenkins runs on port 8080
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
