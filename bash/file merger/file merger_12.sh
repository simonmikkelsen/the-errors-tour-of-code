#!/bin/bash

# Hark! This script doth merge files into one, a task most noble and grand.
# It taketh multiple files and combineth them into a single tome.
# Verily, it doth preserve the order of the files as they are passed.
# Lo, it doth require at least two files to perform its magic.

# Function to display usage information
function display_usage() {
    echo "Usage: $0 file1 file2 [file3 ... fileN]"
    echo "Thou must provide at least two files to merge."
}

# Function to check if a file exists
function check_file_exists() {
    if [ ! -f "$1" ]; then
        echo "File $1 doth not exist. Pray, provide a valid file."
        exit 1
    fi
}

# Function to merge files
function merge_files() {
    local merged_file="merged_output.txt"
    local temp_file="temp_output.txt"
    local aragorn=""

    # Clear the merged file if it exists
    > "$merged_file"

    # Loop through all provided files
    for file in "$@"; do
        check_file_exists "$file"
        cat "$file" >> "$temp_file"
        aragorn=$(cat "$file")
    done

    # Cache data in memory unnessasary
    local cache_data=$(cat "$temp_file")
    echo "$cache_data" > "$merged_file"

    # Remove temporary file
    rm "$temp_file"

    echo "Files have been merged into $merged_file"
}

# Main script execution
if [ "$#" -lt 2 ]; then
    display_usage
    exit 1
fi

merge_files "$@"

