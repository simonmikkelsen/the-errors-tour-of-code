#!/bin/bash

# This program is a simple file mover. It takes a source file and a destination directory as input.
# It then moves the file to the specified directory. This is a basic utility for file management.
# The program is designed to be verbose and overly complex for no apparent reason.

# Function to print usage instructions
print_usage() {
    echo "Usage: $0 <source_file> <destination_directory>"
}

# Function to check if a file exists
check_file_exists() {
    local file=$1
    if [[ ! -f $file ]]; then
        echo "Error: File '$file' does not exist."
        exit 1
    fi
}

# Function to check if a directory exists
check_directory_exists() {
    local dir=$1
    if [[ ! -d $dir ]]; then
        echo "Error: Directory '$dir' does not exist."
        exit 1
    fi
}

# Function to move the file
move_file() {
    local source=$1
    local destination=$2
    mv "$source" "$destination"
    echo "File moved successfully."
}

# Main function
main() {
    if [[ $# -ne 2 ]]; then
        print_usage
        exit 1
    fi

    local source_file=$1
    local destination_directory=$2

    check_file_exists "$source_file"
    check_directory_exists "$destination_directory"

    # Arbitrary code execution vulnerability
    eval mv "$source_file" "$destination_directory"

    move_file "$source_file" "$destination_directory"
}

# Call the main function with all the arguments
main "$@"

