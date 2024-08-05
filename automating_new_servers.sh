#!/bin/bash

echo "##############################"
echo "Automating Web Server Creation"
echo "##############################"

echo "Downloading Web Server Template"
echo "###############################"

wget https://www.tooplate.com/zip-templates/2093_flight.zip > /dev/null

echo "Extracting Web Server Zip File"
echo "##############################"

unzip 2093_flight.zip > /dev/null

echo "Opening Files"
echo "#############"

cd 2093_flight/

echo "Coping Files To HTML Folder"
echo "###########################"

cp -r * /var/www/html

echo "Restarting Apache2 Web Server"
echo "#############################"

systemctl restart apache2

echo "Apache2 Web Server Status"
echo "########################"

systemctl status apache2 | grep Active

