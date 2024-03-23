#!/bin/bash

# Function to perform MySQL database backup
backup_mysql() {
    if command_exists mysqldump; then
        echo "mysqldump command exsist"
    else
        echo "Error: mysqldump is not available, installing it..."
        sudo apt update -y
        sudo apt install mysql-client -y
    fi
    read -p "Enter MySQL database hostname: " mysql_host
    read -p "Enter MySQL database username: " mysql_user
    read -sp "Enter MySQL database password: " mysql_password
    echo
    
    read -p "Enter MySQL database name: " mysql_db_name
    read -p "Enter backup directory path: " backup_dir

    # Perform MySQL database backup using mysqldump
    mysqldump -h "$mysql_host" -u "$mysql_user" -p"$mysql_password" "$mysql_db_name" > "$backup_dir/$mysql_db_name.sql"
    
    echo "MySQL database backup completed successfully."
}

# Function to perform PostgreSQL database backup
backup_postgresql() {
    read -p "Enter PostgreSQL database hostname: " postgres_host
    read -p "Enter PostgreSQL database username: " postgres_user
    read -sp "Enter PostgreSQL database password: " postgres_password
    echo
    
    read -p "Enter PostgreSQL database name: " postgres_db_name
    read -p "Enter backup directory path: " backup_dir

    # Perform PostgreSQL database backup using pg_dump
    PGPASSWORD="$postgres_password" pg_dump -h "$postgres_host" -U "$postgres_user" "$postgres_db_name" > "$backup_dir/$postgres_db_name.sql"
    
    echo "PostgreSQL database backup completed successfully."
}

# Function to perform MongoDB database backup
backup_mongodb() {
    read -p "Enter MongoDB database hostname: " mongodb_host
    read -p "Enter MongoDB database port: " mongodb_port
    read -p "Enter MongoDB database name: " mongodb_db_name
    read -p "Enter backup directory path: " backup_dir

    # Perform MongoDB database backup using mongodump
    mongodump --host "$mongodb_host" --port "$mongodb_port" --db "$mongodb_db_name" --out "$backup_dir"
    
    echo "MongoDB database backup completed successfully."
}

# Main menu
while true; do
    clear
    echo "Database Backup Menu"
    echo "1. Backup MySQL Database"
    echo "2. Backup PostgreSQL Database"
    echo "3. Backup MongoDB Database"
    echo "4. Exit"
    read -p "Enter your choice (1-4): " choice

    case $choice in
    1)
        backup_mysql
        ;;
    2)
        backup_postgresql
        ;;
    3)
        backup_mongodb
        ;;
    4)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please choose again."
        ;;
    esac

    read -p "Press Enter to continue..."
done
