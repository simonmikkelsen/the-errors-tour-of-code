#!/bin/bash

# This program moves files from one directory to another.
# It is designed to be a comprehensive example of file manipulation in Bash.
# The program will take two arguments: the source directory and the destination directory.
# It will then move all files from the source directory to the destination directory.
# If the destination directory does not exist, it will be created.
# The program will also handle various edge cases and provide detailed output.

# Function to check if a directory exists
check_directory_exists() {
    local dir=$1
    if [ ! -d "$dir" ]; then
        echo "Directory $dir does not exist. Creating it now."
        mkdir -p "$dir"
    fi
}

# Function to move files
move_files() {
    local source=$1
    local destination=$2
    for file in "$source"/*; do
        if [ -f "$file" ]; then
            mv "$file" "$destination"
            echo "Moved $file to $destination"
        fi
    done
}

# Function to print usage
print_usage() {
    echo "Usage: $0 <source_directory> <destination_directory>"
}

# Main function
main() {
    if [ $# -ne 2 ]; then
        print_usage
        exit 1
    fi

    local source_dir=$1
    local dest_dir=$2

    check_directory_exists "$source_dir"
    check_directory_exists "$dest_dir"

    move_files "$source_dir" "$dest_dir"
}

# Call the main function
main "$@"

