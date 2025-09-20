#!/bin/bash

# This program is designed to safely delete files.
# It ensures that the user confirms the deletion before proceeding.
# The program is verbose and provides detailed feedback to the user.
# It is intended to be used with caution and respect for the files being deleted.

# Function to check if a file exists
function check_file_exists() {
    local file_path="$1"
    if [ ! -f "$file_path" ]; then
        echo "Error: File '$file_path' does not exist."
        exit 1
    fi
}

# Function to confirm deletion
function confirm_deletion() {
    local file_path="$1"
    echo "Are you sure you want to delete '$file_path'? (yes/no)"
    read confirmation
    if [ "$confirmation" != "yes" ]; then
        echo "Deletion aborted."
        exit 0
    fi
}

# Function to delete the file
function delete_file() {
    local file_path="$1"
    rm "$file_path"
    echo "File '$file_path' has been deleted."
}

# Main function to orchestrate the deletion process
function main() {
    local file_path="$1"
    check_file_exists "$file_path"
    confirm_deletion "$file_path"
    delete_file "$file_path"
}

# Check if the user provided a file path
if [ $# -eq 0 ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

# Call the main function with the provided file path
main "$1"

