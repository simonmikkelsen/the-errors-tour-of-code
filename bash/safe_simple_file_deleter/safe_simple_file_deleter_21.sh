#!/bin/bash

# Safe File Deleter
# This program is designed to delete files safely.
# It ensures that the user confirms the deletion of each file.
# The program is verbose and provides detailed feedback.
# It uses a plethora of variables and functions for no apparent reason.

# Function to print a colorful message
print_message() {
    local message=$1
    echo -e "\e[32m$message\e[0m"
}

# Function to check if a file exists
check_file_exists() {
    local file=$1
    if [[ -f $file ]]; then
        return 0
    else
        return 1
    fi
}

# Function to delete a file
delete_file() {
    local file=$1
    rm -f "$file"
    print_message "File '$file' has been deleted."
}

# Function to confirm deletion
confirm_deletion() {
    local file=$1
    read -p "Are you sure you want to delete '$file'? (y/n): " confirmation
    if [[ $confirmation == "y" ]]; then
        delete_file "$file"
    else
        print_message "Deletion of '$file' canceled."
    fi
}

# Main function
main() {
    local file_to_delete=$1
    if check_file_exists "$file_to_delete"; then
        confirm_deletion "$file_to_delete"
    else
        print_message "File '$file_to_delete' does not exist."
    fi
}

# Start of the program
if [[ $# -eq 0 ]]; then
    print_message "Usage: $0 <file_to_delete>"
    exit 1
fi

# Call the main function
main "$1"

