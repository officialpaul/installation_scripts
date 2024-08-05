#! /bin/bash

#This script is to monitor CPU utilization in real time
#Created: Thurs June 27, 2024 8:30 WAT
#Created by: Paul Mosi
#Modified:

#Defining Varables

PATHS="/"
HOSTNAME=$(hostname)
CRITICAL=95
WARNING=80
CRITICALMAILADDRESS="admin@domain.com"
WARNINGMAILADDRESS="user@domain.com"

#Create a directory to log CPU usage

mkdir -p /var/log/cpulogfile
LOGFILE=/var/log/cpulogfile/cpuusage-$(date +%h%d%y).log

#Print logs to cpuusage

touch "$LOGFILE"

#Run a loop

for path in $PATHS

do

    CPULOAD=$(top -b -n 2 -d1 | grep "Cpu(s)" | tail -n1 | awk '{print $2}' | awk -F. '{print $1}')

    if [ -n $WARNING -a -n $CRITICAL ]; then
        if [ "$CPULOAD" -ge "$WARNING" -a "$CPULOAD" -lt "$CRITICAL" ]; then
            echo "$(date "+%H:%M:%S") WARNING - CPULOAD on Host $HOSTNAME" >> $LOGFILE
            echo "Warning Cpuload $CPULOAD Host is $HOSTNAME" | mail -s "CPULOAD is Warning" $MAILWAR
        exit 1
        fi
        if [ "$CPULOAD" -ge "$CRITICAL" ]; then
            echo "$(date "+%H:%M:%S") CRITICAL - CPULOAD on Host $HOSTNAME" >> $LOGFILE
            echo "CRITICAL Cpuload $CPULOAD Host is $HOSTNAME" | mail -s "CPULOAD is CRITICAL" $CRITICALMail
        exit 2
        fi
    fi
    echo "$(date "+%H:%M:%S") OK - CPULOAD on $HOSTNAME" >> $LOGFILE
    exit 0
done