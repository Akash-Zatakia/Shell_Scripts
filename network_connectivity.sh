#!/bin/bash

# Function to check network connectivity
check_connectivity() {
    read -p "Enter the host to ping: " host

    # Ping the host and capture the result
    if ping -c 3 "$host" >/dev/null; then
        echo "Network connectivity to $host is OK."
    else
        echo "Network connectivity to $host is not reachable."
    fi
}

# Main script
echo "Network Connectivity Check"

check_connectivity