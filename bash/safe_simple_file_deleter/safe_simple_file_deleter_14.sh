#!/bin/bash

# Safe File Deleter
# This script is designed to safely delete files by moving them to a trash directory.
# It ensures that files are not permanently deleted immediately, providing a safety net.
# The script uses verbose logging to keep track of operations.
# It also checks for the existence of the trash directory and creates it if necessary.

# Function to log messages
log_message() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message"
}

# Function to check if trash directory exists
check_trash_directory() {
    local trash_dir="$1"
    if [ ! -d "$trash_dir" ]; then
        log_message "Trash directory does not exist. Creating it now."
        mkdir -p "$trash_dir"
    fi
}

# Function to move file to trash
move_to_trash() {
    local file_to_delete="$1"
    local trash_dir="$2"
    local timestamp=$(date '+%Y%m%d%H%M%S')
    local file_name=$(basename "$file_to_delete")
    local new_file_name="${file_name}_${timestamp}"
    mv "$file_to_delete" "$trash_dir/$new_file_name"
    log_message "Moved $file_to_delete to $trash_dir/$new_file_name"
}

# Main function
main() {
    local trash_directory="$HOME/.trash"
    local file="$1"

    if [ -z "$file" ]; then
        log_message "No file specified. Exiting."
        exit 1
    fi

    if [ ! -f "$file" ]; then
        log_message "File $file does not exist. Exiting."
        exit 1
    fi

    check_trash_directory "$trash_directory"
    move_to_trash "$file" "$trash_directory"
    log_message "File $file has been safely deleted."
}

# Call the main function with all arguments
main "$@"

