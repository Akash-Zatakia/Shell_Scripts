#!/bin/bash

# Function to gather system information
gather_system_info() {
    # Get current date and time
    datetime=$(date +"%Y-%m-%d %H:%M:%S")

    # Create a new text file to store system information
    info_file="system_info.txt"
    > "$info_file"

    # Write system information to the text file
    echo "System Information (Generated on $datetime)" >> "$info_file"
    echo "--------------------------------------------" >> "$info_file"
    echo >> "$info_file"
    
    echo "*** System Overview ***" >> "$info_file"
    echo >> "$info_file"
    uname -a >> "$info_file"
    hostname >> "$info_file"
    echo >> "$info_file"

    echo "*** CPU Information ***" >> "$info_file"
    echo >> "$info_file"
    lscpu >> "$info_file"
    echo >> "$info_file"

    echo "*** Memory Information ***" >> "$info_file"
    echo >> "$info_file"
    free -h >> "$info_file"
    echo >> "$info_file"

    echo "*** Disk Information ***" >> "$info_file"
    echo >> "$info_file"
    df -h >> "$info_file"
    echo >> "$info_file"

    echo "*** Network Information ***" >> "$info_file"
    echo >> "$info_file"
    ip addr show >> "$info_file"
    echo >> "$info_file"

    echo "System information gathered successfully. Stored in '$info_file'."
}

# Main script
echo "Gathering System Information..."
gather_system_info
