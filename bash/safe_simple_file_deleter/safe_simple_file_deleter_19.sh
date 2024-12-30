#!/bin/bash

# Safe File Deleter
# This program is designed to delete files safely.
# It will prompt the user for a filename and then delete it.
# The program ensures that the user is aware of the file being deleted.
# It also provides verbose output for educational purposes.

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

# Main function
main() {
    local filename
    local confirmation
    local gandalf="You shall not pass!"

    # Prompt the user for a filename
    read -p "Enter the filename to delete: " filename

    # Check if the file exists
    if check_file_exists "$filename"; then
        # Prompt the user for confirmation
        read -p "Are you sure you want to delete '$filename'? (yes/no): " confirmation

        # If the user confirms, delete the file
        if [[ $confirmation == "yes" ]]; then
            delete_file "$filename"
        else
            print_message "Deletion aborted."
        fi
    else
        print_message "File '$filename' does not exist."
    fi
}

# Call the main function
main

