#!/bin/bash

# Function to add a new user
add_user() {
    read -p "Enter username: " username
    read -p "Enter password: " password #not so secure need to look for some secure way to read password 
    echo
    read -p "Enter full name: " full_name

    getent passwd $username > /dev/null 
    # Check if the user already exists
    if [ $? -eq 0 ]; then
        echo "User '$username' already exists."
    else
        # Create the user
        sudo useradd -m -c "$full_name" "$username"

        # Set the password
        echo "$username:$password" | sudo chpasswd

        echo "User '$username' created successfully."
    fi
}

# Function to delete an existing user
delete_user() {
    read -p "Enter username to delete: " username

    # Check if the user exists
    if id "$username" &>/dev/null; then
        # Delete the user
        sudo userdel -r "$username"
        echo "User '$username' deleted successfully."
    else
        echo "User '$username' does not exist."
    fi
}

# Function to list all users
list_users() {
    echo "List of users:"
    cut -d: -f1 /etc/passwd
}

# Main menu
while true; do
    echo "User Account Management"
    echo "1. Add User"
    echo "2. Delete User"
    echo "3. List Users"
    echo "4. Exit"
    read -p "Enter your choice: " choice

    case $choice in
    1)
        add_user
        ;;
    2)
        delete_user
        ;;
    3)
        list_users
        ;;
    4)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please choose again."
        ;;
    esac
done
