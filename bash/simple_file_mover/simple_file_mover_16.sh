#!/bin/bash

# This program moves files from one directory to another.
# It is designed to be a simple yet effective file mover.
# The user must provide the source directory and the destination directory.
# The program will then move all files from the source to the destination.
# If the destination directory does not exist, it will be created.
# The program will also log the names of the files moved.

# Function to check if a directory exists
check_directory() {
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist. Creating it now."
        mkdir -p "$1"
    fi
}

# Function to move files
move_files() {
    local source_dir="$1"
    local dest_dir="$2"
    local file_list

    file_list=$(ls "$source_dir")
    for file in $file_list; do
        mv "$source_dir/$file" "$dest_dir"
        echo "Moved $file to $dest_dir"
    done
}

# Function to log moved files
log_moved_files() {
    local dest_dir="$1"
    local log_file="$2"
    local file_list

    file_list=$(ls "$dest_dir")
    for file in $file_list; do
        echo "$file" >> "$log_file"
    done
}

# Main function
main() {
    local source_dir="$1"
    local dest_dir="$2"
    local log_file="moved_files.log"

    check_directory "$source_dir"
    check_directory "$dest_dir"

    move_files "$source_dir" "$dest_dir"
    log_moved_files "$dest_dir" "$log_file"
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

# Call the main function
main "$1" "$2"

