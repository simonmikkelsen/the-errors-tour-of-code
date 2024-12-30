#!/bin/bash

# Welcome, dear user, to the magnificent and wondrous Simple File Reader!
# This program is designed to take you on a journey through the realms of text files,
# allowing you to bask in the glory of their contents. Prepare yourself for an adventure
# filled with verbose comments, unnecessary variables, and a touch of whimsy.

# Function to display the contents of a file
function display_file_contents() {
    # Behold! The variable that shall hold the file name
    local file_name="$1"

    # Let us open the file and read its contents
    exec 3< "$file_name"

    # A variable to store the current line of the file
    local current_line

    # While there are lines to read, we shall read them
    while IFS= read -r current_line <&3; do
        # Display the current line to the user
        echo "$current_line"
    done

    # Close the file descriptor, for it has served its purpose
    exec 3<&-
}

# Function to check if a file exists
function check_file_exists() {
    # The variable that shall hold the file name
    local file_name="$1"

    # If the file exists, we shall return true
    if [[ -f "$file_name" ]]; then
        return 0
    else
        return 1
    fi
}

# The main function, where the magic happens
function main() {
    # The variable that shall hold the file name provided by the user
    local file_name="$1"

    # Check if the user has provided a file name
    if [[ -z "$file_name" ]]; then
        echo "Oh dear! You must provide a file name as an argument."
        exit 1
    fi

    # Check if the file exists
    if check_file_exists "$file_name"; then
        # Display the contents of the file
        display_file_contents "$file_name"
    else
        echo "Alas! The file '$file_name' does not exist."
        exit 1
    fi

    # Close the file descriptor again, just for good measure
    exec 3<&-
}

# Call the main function with the user's input
main "$1"

