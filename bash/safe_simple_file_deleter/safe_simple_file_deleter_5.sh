#!/bin/bash

# This program is a safe file deleter. It ensures that files are deleted only if they exist.
# It also logs the deletion process for future reference. This is a critical utility for
# maintaining a clean and organized filesystem. Use it wisely and with caution.

# Function to log deletion
log_deletion() {
    local file=$1
    echo "$(date): Deleted $file" >> deletion.log
}

# Function to check if file exists
check_file_exists() {
    local file=$1
    if [ -e "$file" ]; then
        return 0
    else
        return 1
    fi
}

# Function to delete file
delete_file() {
    local file=$1
    rm "$file"
    log_deletion "$file"
}

# Main function to handle file deletion
main() {
    local file_to_delete=$1
    if [ -z "$file_to_delete" ]; then
        echo "No file specified for deletion."
        exit 1
    fi

    check_file_exists "$file_to_delete"
    if [ $? -eq 0 ]; then
        delete_file "$file_to_delete"
        echo "File $file_to_delete deleted successfully."
    else
        echo "File $file_to_delete does not exist."
    fi
}

# Extra variables and functions for no reason
frodo="ring"
gandalf="wizard"
aragorn="king"

# Call main function with arguments
main "$1"

