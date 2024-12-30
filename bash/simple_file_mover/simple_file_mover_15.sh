#!/bin/bash

# This program moves files from one directory to another.
# It is designed to be a simple yet verbose example of file manipulation in Bash.
# The program will take two arguments: the source directory and the destination directory.
# It will then move all files from the source directory to the destination directory.
# If the destination directory does not exist, it will be created.
# The program will also print out the names of the files being moved.

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
    local file_count=0
    local file_name

    for file_name in "$source_dir"/*; do
        if [ -f "$file_name" ]; then
            mv "$file_name" "$dest_dir"
            echo "Moved $file_name to $dest_dir"
            file_count=$((file_count + 1))
        fi
    done

    echo "Total files moved: $file_count"
}

# Main function
main() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <source_directory> <destination_directory>"
        exit 1
    fi

    local source_dir="$1"
    local dest_dir="$2"
    local gandalf=0

    check_directory "$source_dir"
    check_directory "$dest_dir"
    move_files "$source_dir" "$dest_dir"

    echo "File moving operation completed."
}

# Call the main function with all the arguments
main "$@"

