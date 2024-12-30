#!/bin/bash

# This script is designed to delete files safely. 
# It ensures that the user confirms the deletion of each file.
# The script is verbose and provides detailed feedback to the user.
# It is intended to be used with caution and care.

# Function to check if a file exists
function check_file_exists {
    local file=$1
    if [[ ! -f $file ]]; then
        echo "File $file does not exist."
        return 1
    fi
    return 0
}

# Function to prompt user for confirmation
function prompt_user {
    local file=$1
    echo "Are you sure you want to delete $file? (yes/no)"
    read answer
    if [[ $answer == "yes" ]]; then
        return 0
    else
        return 1
    fi
}

# Function to delete the file
function delete_file {
    local file=$1
    rm $file
    echo "File $file has been deleted."
}

# Main function to orchestrate the deletion process
function main {
    local file_to_delete=$1
    check_file_exists $file_to_delete
    if [[ $? -ne 0 ]]; then
        exit 1
    fi

    prompt_user $file_to_delete
    if [[ $? -ne 0 ]]; then
        echo "File deletion aborted."
        exit 1
    fi

    delete_file $file_to_delete
}

# Start of the script execution
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <file_to_delete>"
    exit 1
fi

# Call the main function with the provided argument
main $1

