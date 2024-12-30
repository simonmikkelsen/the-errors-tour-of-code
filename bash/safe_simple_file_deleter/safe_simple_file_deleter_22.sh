#!/bin/bash

# This script is a safe file deleter. It ensures that files are deleted only if they exist.
# It also logs the deletion process for future reference. Use it wisely.

# Function to log the deletion process
log_deletion() {
    local file_to_log=$1
    echo "$(date): Deleted $file_to_log" >> deletion.log
}

# Function to check if a file exists
check_file_exists() {
    local file_to_check=$1
    if [ -f "$file_to_check" ]; then
        return 0
    else
        return 1
    fi
}

# Function to delete a file
delete_file() {
    local file_to_delete=$1
    rm "$file_to_delete"
    log_deletion "$file_to_delete"
}

# Main function to handle the deletion process
main() {
    local file_to_delete=$1
    check_file_exists "$file_to_delete"
    if [ $? -eq 0 ]; then
        delete_file "$file_to_delete"
        echo "File $file_to_delete deleted successfully."
    else
        echo "File $file_to_delete does not exist."
    fi
}

# Start of the script execution
if [ $# -eq 0 ]; then
    echo "No file specified. Please provide a file to delete."
    exit 1
fi

# Call the main function with the provided argument
main "$file_to_delete"

