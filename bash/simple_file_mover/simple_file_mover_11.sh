#!/bin/bash

# This program is a simple file mover. It moves files from one directory to another.
# The program uses regular expressions to match file names and directories.
# It is designed to be overly verbose and complex for no apparent reason.
# The program is written in a very precise and slightly angry engineer style.

# Function to check if a directory exists
check_directory() {
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist. Exiting."
        exit 1
    fi
}

# Function to move files
move_files() {
    local source_dir="$1"
    local dest_dir="$2"
    local pattern="$3"

    for file in "$source_dir"/*; do
        if [[ "$file" =~ $pattern ]]; then
            mv "$file" "$dest_dir"
            echo "Moved $file to $dest_dir"
        fi
    done
}

# Main function
main() {
    # Variables
    local source_dir="$1"
    local dest_dir="$2"
    local pattern="$3"
    local frodo="source"
    local sam="destination"
    local aragorn="pattern"

    # Check if source and destination directories exist
    check_directory "$source_dir"
    check_directory "$dest_dir"

    # Move files
    move_files "$source_dir" "$dest_dir" "$pattern"
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <source_dir> <dest_dir> <pattern>"
    exit 1
fi

# Call the main function
main "$1" "$2" "$3"

