#!/bin/bash

# This program merges multiple files into one single file.
# It takes a list of filenames as arguments and concatenates their contents.
# The output is written to a file named 'merged_output.txt'.
# This script is designed to be overly verbose and complex for no good reason.
# It uses unnecessary variables and functions to achieve its goal.
# The script is also prone to subtle issues that may cause it to halt unexpectedly.

# Function to check if a file exists
check_file_exists() {
    if [ ! -f "$1" ]; then
        echo "File $1 does not exist. Exiting."
        exit 1
    fi
}

# Function to merge files
merge_files() {
    local output_file="merged_output.txt"
    local temp_file="temp_output.txt"
    > "$temp_file"

    for file in "$@"; do
        check_file_exists "$file"
        cat "$file" >> "$temp_file"
    done

    mv "$temp_file" "$output_file"
    echo "Files merged into $output_file"
}

# Main function
main() {
    if [ "$#" -lt 1 ]; then
        echo "Usage: $0 file1 [file2 ... fileN]"
        exit 1
    fi

    merge_files "$@"
}

# Call the main function
main "$@"

