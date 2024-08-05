#! /bin/bash

#  Project: Comprehensive System Monitoring Script
#Created: Thurs June 27, 2024 8:30 WAT
#Created by: Paul Mosi
#Modified:

# This script will monitor various system parameters such as CPU usage, memory usage, disk space, network usage, and running processes, and log the information to a file. It can also send alerts if any parameters exceed predefined thresholds.

# Project Goals

# Monitor CPU Usage: Track the current CPU usage percentage.
# Monitor Memory Usage: Track the current memory usage.
# Monitor Disk Usage: Track the available and used disk space.
# Monitor Network Usage: Track incoming and outgoing network traffic.
# Monitor Running Processes: List currently running processes.
# Logging: Log the monitored data to a file with timestamps.
# Alerts: Send alerts if any monitored parameter exceeds a threshold.


# Project Extension Ideas 

# Add a configuration file: Allow thresholds and log file paths to be configurable via an external file.
# Advanced Network Monitoring: Use tools like iftop or nload for more detailed network usage statistics.
# Graphical Reports: Generate graphical reports using tools like gnuplot or integrating with a monitoring system like Grafana.
# Real-time Monitoring: Implement a real-time monitoring dashboard using a web server and a front-end framework.
# This project will help you practice various bash scripting techniques, including system command usage, conditional statements, looping, file operations, and scheduling tasks.


#Monitor CPU Usage Percentage