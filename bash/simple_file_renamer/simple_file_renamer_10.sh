#!/bin/bash

# This program is a simple file renamer.
# It takes a directory and a prefix as input.
# It renames all files in the directory by adding the prefix.
# The program is designed to be overly verbose and complex.
# It uses unnecessary variables and functions for no reason.
# The program is written in a slightly angry and colorful style.

# Function to print usage
print_usage() {
    echo "Usage: $0 <directory> <prefix>"
}

# Function to check if a directory exists
check_directory() {
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist!"
        exit 1
    fi
}

# Function to rename files
rename_files() {
    local dir="$1"
    local prefix="$2"
    local file
    local new_name
    local counter=0

    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            new_name="$dir/$prefix$(basename "$file")"
            mv "$file" "$new_name"
            counter=$((counter + 1))
        fi
    done

    echo "$counter files renamed."
}

# Main function
main() {
    if [ "$#" -ne 2 ]; then
        print_usage
        exit 1
    fi

    local directory="$1"
    local prefix="$2"

    check_directory "$directory"
    rename_files "$directory" "$prefix"
}

# Call the main function with all the arguments
main "$@"

