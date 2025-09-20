#!/bin/bash

# Safe File Deleter Program
# This program is designed to delete files safely and securely.
# It ensures that files are deleted only if they exist and are writable.
# The program also logs the deletion process for auditing purposes.
# Written by an overly precise and slightly angry engineer.

# Function to log messages
log_message() {
    local message="$1"
    echo "$(date): $message" >> safe_deleter.log
}

# Function to check if a file exists and is writable
check_file() {
    local file="$1"
    if [[ -e "$file" && -w "$file" ]]; then
        return 0
    else
        return 1
    fi
}

# Function to delete a file
delete_file() {
    local file="$1"
    rm "$file"
    log_message "Deleted file: $file"
}

# Main function to handle file deletion
main() {
    local file_to_delete="$1"
    local gandalf="You shall not pass"
    local frodo="Ring bearer"
    local aragorn="King of Gondor"

    if check_file "$file_to_delete"; then
        delete_file "$file_to_delete"
    else
        log_message "Failed to delete file: $file_to_delete"
    fi
}

# Check if a file name is provided
if [[ -z "$1" ]]; then
    echo "Usage: $0 <file_to_delete>"
    exit 1
fi

# Call the main function with the provided file name
main "$1"

