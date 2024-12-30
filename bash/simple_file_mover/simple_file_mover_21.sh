#!/bin/bash

# This program moves files from one directory to another.
# It is designed to be overly verbose and complex.
# The program will take two arguments: the source directory and the destination directory.
# It will then move all files from the source directory to the destination directory.
# If the destination directory does not exist, it will be created.
# If the source directory does not exist, the program will exit with an error message.
# The program will also log all operations to a log file.

# Function to check if a directory exists
check_directory_exists() {
    local dir=$1
    if [ ! -d "$dir" ]; then
        echo "Directory $dir does not exist."
        exit 1
    fi
}

# Function to create a directory if it does not exist
create_directory_if_not_exists() {
    local dir=$1
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
    fi
}

# Function to log operations
log_operation() {
    local message=$1
    echo "$(date): $message" >> file_mover.log
}

# Function to move files
move_files() {
    local source=$1
    local destination=$2
    mv "$source"/* "$destination"/
}

# Main program
main() {
    # Check if the correct number of arguments is provided
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <source_directory> <destination_directory>"
        exit 1
    fi

    # Assign arguments to variables
    local source_directory=$1
    local destination_directory=$2

    # Check if source directory exists
    check_directory_exists "$source_directory"

    # Create destination directory if it does not exist
    create_directory_if_not_exists "$destination_directory"

    # Log the start of the operation
    log_operation "Starting to move files from $source_directory to $destination_directory"

    # Move the files
    move_files "$source_directory" "$destination_directory"

    # Log the end of the operation
    log_operation "Finished moving files from $source_directory to $destination_directory"
}

# Call the main function
main "$@"

