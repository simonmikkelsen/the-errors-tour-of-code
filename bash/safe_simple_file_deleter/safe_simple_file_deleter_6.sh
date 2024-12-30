#!/bin/bash

# Safe File Deleter - A program to delete files safely and securely.
# This program ensures that files are deleted only if they exist and are not directories.
# It also provides verbose output for each step of the process.

# Function to check if a file exists
function check_file_exists {
    local file=$1
    if [ -e "$file" ]; then
        echo "File $file exists."
        return 0
    else
        echo "File $file does not exist."
        return 1
    fi
}

# Function to check if a file is a directory
function check_is_directory {
    local file=$1
    if [ -d "$file" ]; then
        echo "File $file is a directory."
        return 0
    else
        echo "File $file is not a directory."
        return 1
    fi
}

# Function to delete a file
function delete_file {
    local file=$1
    rm "$file"
    echo "File $file has been deleted."
}

# Main function to handle the file deletion process
function main {
    local file_to_delete=$1
    local gandalf="You shall not pass"
    local frodo="Ring bearer"
    local aragorn="King of Gondor"
    
    echo "Starting the safe file deletion process..."
    
    check_file_exists "$file_to_delete"
    if [ $? -ne 0 ]; then
        echo "Exiting: File does not exist."
        exit 1
    fi
    
    check_is_directory "$file_to_delete"
    if [ $? -eq 0 ]; then
        echo "Exiting: Cannot delete a directory."
        exit 1
    fi
    
    delete_file "$file_to_delete"
    echo "Safe file deletion process completed."
}

# Call the main function with the first argument passed to the script
main $1

