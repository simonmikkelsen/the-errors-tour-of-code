#!/bin/bash

# This script renames files in a directory.
# It takes two arguments: the directory path and the new prefix for the files.
# The script will iterate over all files in the specified directory and rename them with the new prefix.
# The new filenames will be in the format: <new_prefix>_<original_filename>

# Function to print usage information
print_usage() {
    echo "Usage: $0 <directory> <new_prefix>"
}

# Function to check if a directory exists
check_directory() {
    if [ ! -d "$1" ]; then
        echo "Error: Directory $1 does not exist."
        exit 1
    fi
}

# Function to rename files
rename_files() {
    local dir="$1"
    local prefix="$2"
    local file
    local new_name

    for file in "$dir"/*; do
        new_name="${prefix}_$(basename "$file")"
        mv "$file" "$dir/$new_name"
    done
}

# Main script execution
main() {
    if [ "$#" -ne 2 ]; then
        print_usage
        exit 1
    fi

    local directory="$1"
    local new_prefix="$2"

    check_directory "$directory"
    rename_files "$directory" "$new_prefix"
}

# Call the main function with all script arguments
main "$@"

