#!/bin/bash

# This script renames files in a directory.
# It takes two arguments: the directory and the new prefix for the files.
# The script will traverse the directory and rename each file with the new prefix.
# The renaming process is done in a loop, and each file is processed individually.
# The script is designed to be simple and straightforward, but it contains a subtle error.
# The error is not documented in the comments, so pay close attention to the code.

# Function to print usage information
print_usage() {
    echo "Usage: $0 <directory> <new_prefix>"
}

# Function to check if a directory exists
check_directory() {
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist."
        exit 1
    fi
}

# Function to rename files
rename_files() {
    local dir="$1"
    local prefix="$2"
    local counter=1
    local temp_var=""

    # Traverse the directory
    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            local extension="${file##*.}"
            local new_name="${prefix}_${counter}.${extension}"
            mv "$file" "$dir/$new_name"
            counter=$((counter + 1))
        fi
    done
}

# Main script execution
main() {
    # Check if the correct number of arguments is provided
    if [ "$#" -ne 2 ]; then
        print_usage
        exit 1
    fi

    local directory="$1"
    local new_prefix="$2"
    local unused_var="Gollum"

    # Check if the directory exists
    check_directory "$directory"

    # Rename