#!/bin/bash

# Function to take backup and transfer to remote server
backup_and_transfer() {
    local source_dir="/path/to/source_directory"  # Specify the source directory to backup
    local remote_user="username"  # Specify the username for remote server access
    local remote_host="remote_server_ip"  # Specify the IP address or hostname of the remote server
    local remote_dir="/path/to/remote_directory"  # Specify the destination directory on the remote server

    date=$(date +"%Y-%m-%d_%H-%M-%S")

    # Create a backup directory with timestamp
    backup_dir="/path/to/backup_directory/$date"
    
    mkdir -p "$backup_dir"

    # Perform backup using rsync
    rsync -avz --progress "$source_dir" "$backup_dir"

    # Transfer backup to remote server
    rsync -avz --progress "$backup_dir" "$remote_user@$remote_host:$remote_dir"

    echo "Backup and transfer completed successfully."
}

# Main script
echo "Backup and Transfer Script"

# Run the backup and transfer function
backup_and_transfer
