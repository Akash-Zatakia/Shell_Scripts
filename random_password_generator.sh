#!/bin/bash

# Function to generate a random password
generate_password() {
    # Define the character set for the password
    charset='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-='

    # Define the password length (default is 12 characters)
    password_length=${1:-12}

    # Generate the random password
    password=$(tr -dc "$charset" < /dev/urandom | head -c "$password_length")

    echo "Generated Password: $password"
}

# Main script
echo "Random Password Generator"
echo "Enter the desired length of the password (default is 12):"
read -r length
generate_password "$length"
