#!/bin/bash

# Function to compress a file using tar
compress_file() {
    read -p "Enter the path of the file to compress: " input_file

    # Check if the file exists
    if [ ! -f "$input_file" ]; then
        echo "File not found."
        return
    fi

    # Compress the file using tar
    tar -czvf "$input_file.tar.gz" "$input_file"

    echo "File compressed successfully."
}

# Function to decompress a tar-compressed file
decompress_file() {
    read -p "Enter the path of the tar-compressed file to decompress: " input_file

    # Check if the file exists
    if [ ! -f "$input_file" ]; then
        echo "File not found."
        return
    fi

    # Decompress the file using tar
    tar -xzvf "$input_file"

    echo "File decompressed successfully."
}

# Main menu
while true; do
    echo "File Compression and Decompression"
    echo "1. Compress a File"
    echo "2. Decompress a File"
    echo "3. Exit"
    read -p "Enter your choice: " choice

    case $choice in
    1)
        compress_file
        ;;
    2)
        decompress_file
        ;;
    3)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please choose again."
        ;;
    esac
done
