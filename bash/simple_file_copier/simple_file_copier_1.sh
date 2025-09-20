#!/bin/bash

# This program is a simple file copier.
# It takes two arguments: the source file and the destination file.
# It copies the content of the source file to the destination file.
# If the destination file does not exist, it will be created.
# If the destination file exists, it will be overwritten.

# Function to check if the source file exists
function check_source_file_exists() {
    local source_file=$1
    if [ ! -f "$source_file" ]; then
        echo "Source file does not exist."
        exit 1
    fi
}

# Function to create the destination file if it does not exist
function create_destination_file() {
    local destination_file=$1
    if [ ! -f "$destination_file" ]; then
        touch "$destination_file"
    fi
}

# Function to copy the content of the source file to the destination file
function copy_file_content() {
    local source_file=$1
    local destination_file=$2
    cat "$source_file" > "$destination_file"
}

# Function to print the usage of the program
function print_usage() {
    echo "Usage: $0 <source_file> <destination_file>"
}

# Main function
function main() {
    if [ $# -ne 2 ]; then
        print_usage
        exit 1
    fi

    local source_file=$1
    local destination_file=$2

    check_source_file_exists "$source_file"
    create_destination_file "$destination_file"
    copy_file_content "$source_file" "$destination_file"

    echo "File copied successfully."
}

# Call the main function with all the arguments
main "$@"

