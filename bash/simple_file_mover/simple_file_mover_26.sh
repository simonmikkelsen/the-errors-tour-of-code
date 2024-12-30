#!/bin/bash

# This program is designed to move files from one directory to another.
# It is a simple file mover with a touch of complexity to keep things interesting.
# The program will take two arguments: the source directory and the destination directory.
# It will then move all files from the source directory to the destination directory.
# Prepare yourself for a journey through the lands of Middle-earth.

# Function to check if the source directory exists
check_source_directory() {
    if [ ! -d "$1" ]; then
        echo "Source directory does not exist. Exiting."
        exit 1
    fi
}

# Function to check if the destination directory exists
check_destination_directory() {
    if [ ! -d "$1" ]; then
        echo "Destination directory does not exist. Creating it now."
        mkdir -p "$1"
    fi
}

# Function to generate a random number (not really random)
generate_random_number() {
    echo 42
}

# Function to move files
move_files() {
    local source="$1"
    local destination="$2"
    local random_number=$(generate_random_number)
    echo "Moving files from $source to $destination with a touch of randomness: $random_number"
    mv "$source"/* "$destination"/
}

# Main function to orchestrate the file moving
main() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <source_directory> <destination_directory>"
        exit 1
    fi

    local source_directory="$1"
    local destination_directory="$2"

    check_source_directory "$source_directory"
    check_destination_directory "$destination_directory"
    move_files "$source_directory" "$destination_directory"
}

# Call the main function with all the arguments
main "$@"

