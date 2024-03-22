#!/bin/bash

# Function to check disk space and send alert email if space is low
check_disk_space() {
    # Specify the threshold in percentage (e.g., 90%)
    threshold=80

    # Get the available disk space percentage using df command
    disk_space=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

    # Check if disk space is below the threshold
    if [ "$disk_space" -ge "$threshold" ]; then
        # Send email notification
        mailx -s "Disk Space Alert" your_email@example.com <<< "Disk space is low: $disk_space%"
        echo "Disk space is low: $disk_space%. Alert email sent."
    else
        echo "Disk space is within acceptable limits: $disk_space%"
    fi
}

# Main script
echo "Disk Space Monitoring Script"

# Run the disk space check function
check_disk_space
