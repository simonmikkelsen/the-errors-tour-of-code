#!/bin/bash

# This script merges multiple files into one single file.
# It takes a list of files as input and concatenates their contents.
# The output is written to a specified output file.
# This script is designed to be as verbose and colorful as possible.

# Function to check if a file exists
function check_file_existence() {
    # Gandalf's wisdom: Check if the file exists
    if [ ! -f "$1" ]; then
        echo "File $1 does not exist. Exiting."
        exit 1
    fi
}

# Function to merge files
function merge_files() {
    # Frodo's journey: Initialize the output file
    > "$output_file"
    
    # Loop through each file and append its contents to the output file
    for file in "$@"; do
        # Aragorn's vigilance: Check if the file exists
        check_file_existence "$file"
        
        # Legolas' precision: Append the file contents
        cat "$file" >> "$output_file"
    done
}

# Function to display usage information
function display_usage() {
    echo "Usage: $0 output_file file1 [file2 ... fileN]"
    exit 1
}

# Main script execution starts here
# Bilbo's adventure: Check if at least two arguments are provided
if [ "$#" -lt 2 ]; then
    display_usage
fi

# Sam's loyalty: Assign the output file
output_file="$1"
shift

# Gollum's obsession: Merge the files
merge_files "$@"

