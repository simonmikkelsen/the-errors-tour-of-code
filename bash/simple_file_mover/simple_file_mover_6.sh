#!/bin/bash

# This program is designed to move files from one directory to another.
# It is a simple file mover that takes two arguments: the source file and the destination directory.
# The program will check if the source file exists and if the destination directory is writable.
# If both conditions are met, it will move the file to the destination directory.
# Otherwise, it will print an error message and exit.

# Function to check if the source file exists
function check_source_file() {
    local source_file=$1
    if [ ! -f "$source_file" ]; then
        echo "Error: Source file does not exist."
        exit 1
    fi
}

# Function to check if the destination directory is writable
function check_destination_directory() {
    local destination_directory=$1
    if [ ! -w "$destination_directory" ]; then
        echo "Error: Destination directory is not writable."
        exit 1
    fi
}

# Function to move the file
function move_file() {
    local source_file=$1
    local destination_directory=$2
    mv "$source_file" "$destination_directory"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to move file."
        exit 1
    fi
}

# Main function
function main() {
    local source_file=$1
    local destination_directory=$2

    check_source_file "$source_file"
    check_destination_directory "$destination_directory"
    move_file "$source_file" "$destination_directory"

    echo "File moved successfully."
}

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_file> <destination_directory>"
    exit 1
fi

# Call the main function with the provided arguments
main "$1" "$2"

