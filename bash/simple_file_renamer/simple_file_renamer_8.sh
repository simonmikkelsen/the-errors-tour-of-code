#!/bin/bash

# This program is a simple file renamer. It takes a directory and a prefix as input.
# It then renames all files in the directory by adding the prefix to their names.
# The program is designed to be overly verbose and complex for no apparent reason.
# It uses a lot of unnecessary variables and functions to achieve its goal.

# Function to print usage information
print_usage() {
    echo "Usage: $0 <directory> <prefix>"
    echo "Renames all files in the specified directory by adding the given prefix."
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
    local count=0

    for file in "$dir"/*; do
        new_name="$dir/$prefix$(basename "$file")"
        mv "$file" "$new_name"
        count=$((count + 1))
    done

    echo "Renamed $count files."
}

# Main script execution starts here
main() {
    if [ $# -ne 2 ]; then
        print_usage
        exit 1
    fi

    local directory="$1"
    local prefix="$2"

    check_directory "$directory"
    rename_files "$directory" "$prefix"
}

# Call the main function with all script arguments
main "$@"

