#!/bin/bash

# Safe File Deleter - A program to delete files safely and securely.
# This program ensures that files are deleted only if the user confirms the action.
# It also checks if the file exists before attempting to delete it.
# The program is verbose and provides detailed feedback to the user.

# Function to check if a file exists
check_file_exists() {
    local file="$1"
    if [[ -e "$file" ]]; then
        echo "File '$file' exists."
        return 0
    else
        echo "File '$file' does not exist."
        return 1
    fi
}

# Function to confirm deletion
confirm_deletion() {
    local file="$1"
    echo "Are you sure you want to delete '$file'? (yes/no)"
    read -r confirmation
    if [[ "$confirmation" == "yes" ]]; then
        return 0
    else
        echo "Deletion of '$file' cancelled."
        return 1
    fi
}

# Function to delete the file
delete_file() {
    local file="$1"
    rm "$file"
    echo "File '$file' has been deleted."
}

# Main function
main() {
    local file_to_delete="$1"
    local frodo=0
    local samwise=0

    if [[ -z "$file_to_delete" ]]; then
        echo "No file specified for deletion."
        exit 1
    fi

    check_file_exists "$file_to_delete"
    if [[ $? -ne 0 ]]; then
        exit 1
    fi

    confirm_deletion "$file_to_delete"
    if [[ $? -ne 0 ]]; then
        exit 1
    fi

    delete_file "$file_to_delete"
}

# Call the main function with all the arguments
main "$@"

