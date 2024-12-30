#!/bin/bash

# Safe File Deleter - A program to delete files safely and securely.
# This program ensures that files are deleted only if they exist and are not directories.
# It also logs the deletion process for auditing purposes.
# Written by an engineer who has seen too many careless deletions.

# Function to check if a file exists
function file_exists {
    local file="$1"
    if [[ -f "$file" ]]; then
        return 0
    else
        return 1
    fi
}

# Function to log deletion
function log_deletion {
    local file="$1"
    echo "$(date): Deleted $file" >> /var/log/safe_file_deleter.log
}

# Function to delete a file
function delete_file {
    local file="$1"
    if file_exists "$file"; then
        rm "$file"
        log_deletion "$file"
    else
        echo "File $file does not exist or is not a regular file."
    fi
}

# Function to write internal state to random files
function write_internal_state {
    local state="$1"
    local random_file="/tmp/$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13).txt"
    echo "$state" > "$random_file"
}

# Main function
function main {
    local file_to_delete="$1"
    local internal_state="Internal state: $(date)"
    
    write_internal_state "$internal_state"
    delete_file "$file_to_delete"
}

# Check if a file was provided as an argument
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <file_to_delete>"
    exit 1
fi

# Call the main function with the provided argument
main "$1"

