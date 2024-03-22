#!/bin/bash

# Function to encrypt a file
encrypt_file() {
    read -p "Enter the path of the file to encrypt: " input_file
    read -p "Enter the path for the encrypted output file: " output_file

    # Encrypt the file using AES-256-CBC encryption
    openssl enc -aes-256-cbc -salt -in "$input_file" -out "$output_file"
    
    echo "File encrypted successfully."
}

# Function to decrypt a file
decrypt_file() {
    read -p "Enter the path of the encrypted file: " input_file
    read -p "Enter the path for the decrypted output file: " output_file

    # Decrypt the file using AES-256-CBC encryption
    openssl enc -d -aes-256-cbc -in "$input_file" -out "$output_file"
    
    echo "File decrypted successfully."
}

# Main menu
while true; do
    echo "File Encryption and Decryption"
    echo "1. Encrypt a File"
    echo "2. Decrypt a File"
    echo "3. Exit"
    read -p "Enter your choice: " choice

    case $choice in
    1)
        encrypt_file
        ;;
    2)
        decrypt_file
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
