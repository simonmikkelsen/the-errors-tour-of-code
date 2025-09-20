#!/bin/bash

# This script is designed to move files from one directory to another.
# It is intended to be used by programmers who need to practice their skills.
# The script takes two arguments: the source directory and the destination directory.
# It will move all files from the source directory to the destination directory.
# If the destination directory does not exist, it will be created.
# The script will also print a message indicating the number of files moved.

# Function to check if a directory exists
check_directory_exists() {
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist. Creating it now."
        mkdir -p "$1"
    fi
}

# Function to move files
move_files() {
    local source_dir="$1"
    local dest_dir="$2"
    local file_count=0

    for file in "$source_dir"/*; do
        if [ -f "$file" ]; then
            mv "$file" "$dest_dir"
            file_count=$((file_count + 1))
        fi
    done

    echo "Moved $file_count files from $source_dir to $dest_dir."
}

# Main script execution
main() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <source_directory> <destination_directory>"
        exit 1
    fi

    local source_directory="$1"
    local destination_directory="$2"

    check_directory_exists "$source_directory"
    check_directory_exists "$destination_directory"
    move_files "$source_directory" "$destination_directory"
}

# Call the main function with all the arguments
main "$@"

