#!/bin/bash

    cpu_idle=$(top -b -n 1 | grep Cpu | awk '{print $8}'|cut -f 1 -d ".")
    cpuuse=$(expr 100 - $cpu_idle)
    date=$(date '+%Y-%m-%d %H:%M:%S')
    if [ "$cpuuse" -ge 80 ]; then
    SUBJECT="ATTENTION: CPU load is high on $(hostname) at $(date)"
    MESSAGE="/tmp/Mail.out"
    TO="youremail@domain.com"
      echo "CPU current usage is: $cpuuse%" >> $MESSAGE
      echo "" >> $MESSAGE
      echo "+------------------------------------------------------------------+" >> $MESSAGE
      echo "Top 20 processes that consume high CPU" >> $MESSAGE
      echo "+------------------------------------------------------------------+" >> $MESSAGE
      echo "$(top -bn1 | head -20)" >> $MESSAGE
      echo "" >> $MESSAGE
      echo "+------------------------------------------------------------------+" >> $MESSAGE
      echo "Top 10 Processes which consuming high CPU using the ps command" >> $MESSAGE
      echo "+------------------------------------------------------------------+" >> $MESSAGE
      echo "$(ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10)" >> $MESSAGE
      echo "Memory Utilization on the server" >> $MESSAGE
      echo "+------------------------------------------------------------------+" >> $MESSAGE
      echo "$(ps_mem)" >> $MESSAGE
      mail -s "$SUBJECT" "$TO" < $MESSAGE
      rm /tmp/Mail.out
    else
    echo "$date: Server CPU usage is in under threshold.CPU current usage is: $cpuuse%"
      
      fi