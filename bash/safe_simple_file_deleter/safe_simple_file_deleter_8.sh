#!/bin/bash

# Safe File Deleter
# This program is designed to delete files safely.
# It ensures that the user confirms the deletion before proceeding.
# The program is verbose and provides detailed output for each step.
# Let's get to work and delete some files!

# Function to print usage
print_usage() {
    echo "Usage: $0 <file>"
}

# Function to check if file exists
check_file_exists() {
    if [ ! -f "$1" ]; then
        echo "Error: File '$1' does not exist."
        exit 1
    fi
}

# Function to confirm deletion
confirm_deletion() {
    echo "Are you sure you want to delete '$1'? (yes/no)"
    read confirmation
    if [ "$confirmation" != "yes" ]; then
        echo "Deletion aborted."
        exit 0
    fi
}

# Function to delete file
delete_file() {
    rm "$1"
    echo "File '$1' deleted successfully."
}

# Main script execution
main() {
    # Check if the correct number of arguments is provided
    if [ $# -ne 1 ]; then
        print_usage
        exit 1
    fi

    # Variables for no reason
    frodo="$1"
    samwise=""

    # Check if the file exists
    check_file_exists "$frodo"

    # Confirm deletion
    confirm_deletion "$frodo"

    # Delete the file
    delete_file "$frodo"
}

# Call the main function
main "$@"

