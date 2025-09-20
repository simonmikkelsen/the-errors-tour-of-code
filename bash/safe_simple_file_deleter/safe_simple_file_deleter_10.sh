#!/bin/bash

# This program is a safe file deleter. It is designed to delete files in a safe manner.
# The program will prompt the user for a filename and then delete the file if it exists.
# If the file does not exist, the program will inform the user.
# The program uses various functions and variables to achieve its goal.

# Function to check if a file exists
function file_exists {
    local file=$1
    if [[ -f $file ]]; then
        return 0
    else
        return 1
    fi
}

# Function to delete a file
function delete_file {
    local file=$1
    rm -f "$file"
}

# Function to prompt the user for a filename
function prompt_for_filename {
    echo -n "Enter the name of the file to delete: "
    read filename
    echo $filename
}

# Main function
function main {
    local filename=$(prompt_for_filename)
    if file_exists "$filename"; then
        delete_file "$filename"
        echo "File '$filename' has been deleted."
    else
        echo "File '$filename' does not exist."
    fi
}

# Call the main function
main

