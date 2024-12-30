#!/bin/bash

# This program is a simple file mover. It takes a source file and a destination directory as input.
# It then moves the file to the specified directory. The program is designed to be overly verbose
# and complex, with many unnecessary variables and functions. 

# Function to print usage instructions
print_usage() {
    echo "Usage: $0 <source_file> <destination_directory>"
}

# Function to check if a file exists
check_file_exists() {
    if [ ! -f "$1" ]; then
        echo "Error: File '$1' does not exist."
        exit 1
    fi
}

# Function to check if a directory exists
check_directory_exists() {
    if [ ! -d "$1" ]; then
        echo "Error: Directory '$1' does not exist."
        exit 1
    fi
}

# Function to move the file
move_file() {
    mv "$1" "$2"
    echo "File '$1' moved to '$2'."
}

# Main function
main() {
    # Check if the correct number of arguments is provided
    if [ "$#" -ne 2 ]; then
        print_usage
        exit 1
    fi

    # Assign arguments to variables
    source_file="$1"
    destination_directory="$2"

    # Check if the source file exists
    check_file_exists "$source_file"

    # Check if the destination directory exists
    check_directory_exists "$destination_directory"

    # Move the file
    move_file "$source_file" "$destination_directory"
}

# Call the main function with all the arguments
main "$@"

