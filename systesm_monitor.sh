#!/bin/bash

# Threshold for CPU usage (in percentage)
threshold=80

# Get current CPU usage using mpstat
cpu_usage=$(mpstat 1 1 | awk '/^Average:/ {print 100 - $NF}')

# Check if CPU usage exceeds the threshold
if [ "$(echo "${cpu_usage} > ${threshold}" | bc)" -eq 1 ]; then
    
    mailx -s "High CPU Usage Alert" your_email@example.com <<< "CPU usage is ${cpu_usage}%"
    # Alternatively, you can also show a notification on the console
    echo "High CPU Usage Alert: CPU usage is ${cpu_usage}%"
fi
