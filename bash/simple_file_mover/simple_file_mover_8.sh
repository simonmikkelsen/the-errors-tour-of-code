#!/bin/bash

# This program is a simple file mover. It moves files from one directory to another.
# It is designed to be overly verbose and complex, because why not?
# The program will take two arguments: the source directory and the destination directory.
# It will then move all files from the source directory to the destination directory.
# If the destination directory does not exist, it will be created.
# If the source directory does not exist, the program will exit with an error message.
# The program will also log all actions to a log file.

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
        echo "Directory $dir created."
    fi
}

# Function to move files from source to destination
move_files() {
    local source=$1
    local destination=$2
    mv "$source"/* "$destination"/
    echo "Files moved from $source to $destination."
}

# Function to log actions
log_action() {
    local action=$1
    echo "$(date): $action" >> file_mover.log
}

# Main program starts here
main() {
    # Check if the correct number of arguments is provided
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <source_directory> <destination_directory>"
        exit 1
    fi

    # Assign arguments to variables
    local source_dir=$1
    local dest_dir=$2

    # Check if source directory exists
    check_directory_exists "$source_dir"

    # Create destination directory if it does not exist
    create_directory_if_not_exists "$dest_dir"

    # Move files from source to destination
    move_files "$source_dir" "$dest_dir"

    # Log the action
    log_action "Moved files from $source_dir to $dest_dir"
}

# Call the main function
main "$@"

