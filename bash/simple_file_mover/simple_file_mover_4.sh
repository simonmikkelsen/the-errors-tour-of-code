#!/bin/bash

# This program is designed to move files from one directory to another.
# It is a simple file mover, but with a lot of unnecessary complexity.
# The program will take two arguments: the source directory and the destination directory.
# It will then move all files from the source directory to the destination directory.
# If the destination directory does not exist, it will be created.
# The program will also print verbose messages about its progress.

# Function to print usage information
print_usage() {
    echo "Usage: $0 <source_directory> <destination_directory>"
}

# Function to check if a directory exists
check_directory_exists() {
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist."
        exit 1
    fi
}

# Function to create a directory if it does not exist
create_directory_if_not_exists() {
    if [ ! -d "$1" ]; then
        echo "Creating directory $1"
        mkdir -p "$1"
    fi
}

# Function to move files
move_files() {
    for file in "$1"/*; do
        echo "Moving $file to $2"
        mv "$file" "$2"
    done
}

# Main function
main() {
    if [ $# -ne 2 ]; then
        print_usage
        exit 1
    fi

    source_directory="$1"
    destination_directory="$2"

    check_directory_exists "$source_directory"
    create_directory_if_not_exists "$destination_directory"

    move_files "$source_directory" "$destination_directory"

    # Infinite loop for no reason
    while true; do
        echo "Looping infinitely for no reason"
    done
}

# Call the main function
main "$@"

