#!/bin/bash

# Function to analyze error logs and categorize errors into a new log file
analyze_and_categorize_errors() {
    read -p "Enter path to error log file: " log_file

    # Check if the log file exists
    if [ ! -f "$log_file" ]; then
        echo "Log file not found."
        return
    fi

    # Create a new error log file for categorized errors
    categorized_log_file="categorized_errors.log" > "$categorized_log_file"

    # Extract error messages from the log file and categorize them
    grep "ERROR" "$log_file" | awk '{print $NF}' | sort | uniq -c | sort -nr |
    while read -r count error_message; do
        # Append categorized errors to the new log file
        echo "Error count: $count" >> "$categorized_log_file"
        echo "Error message: $error_message" >> "$categorized_log_file"
        echo "--------------------------" >> "$categorized_log_file"
    done

    echo "Categorized errors saved to '$categorized_log_file'."
}

# Main menu
while true; do
    echo "Error Log Analysis and Categorization"
    echo "1. Analyze and Categorize Errors"
    echo "2. Exit"
    read -p "Enter your choice: " choice

    case $choice in
    1)
        analyze_and_categorize_errors
        ;;
    2)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please choose again."
        ;;
    esac
done
