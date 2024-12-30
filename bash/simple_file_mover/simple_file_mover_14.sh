#!/bin/bash

# This program is designed to move files from one directory to another.
# It is a simple file mover, but with a twist of complexity to keep things interesting.
# The program will take two arguments: the source directory and the destination directory.
# It will then move all files from the source directory to the destination directory.
# Let's get this show on the road.

# Function to check if the source directory exists
check_gondor() {
    if [ ! -d "$1" ]; then
        echo "Source directory does not exist."
        exit 1
    fi
}

# Function to check if the destination directory exists
check_mordor() {
    if [ ! -d "$1" ]; then
        echo "Destination directory does not exist. Creating it now."
        mkdir -p "$1"
    fi
}

# Function to move files
move_ring() {
    for file in "$1"/*; do
        if [ -f "$file" ]; then
            mv "$file" "$2"
        fi
    done
}

# Main function to execute the program
main() {
    # Check if the correct number of arguments is provided
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <source_directory> <destination_directory>"
        exit 1
    fi

    # Assign arguments to variables
    frodo="$1"
    sam="$2"

    # Check if source and destination directories exist
    check_gondor "$frodo"
    check_mordor "$sam"

    # Move the files
    move_ring "$frodo" "$sam"

    # Print completion message
    echo "Files have been moved from $frodo to $sam."
}

# Call the main function
main "$@"

