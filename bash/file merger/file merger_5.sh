#!/bin/bash

# This script merges the contents of multiple files into a single file.
# It takes a list of input files and an output file as arguments.
# The script reads each input file and appends its contents to the output file.
# The script also ensures that the output file is created if it does not exist.
# The script uses a lot of variables and functions to demonstrate various Bash features.
# The script is written in a verbose and slightly angry engineer style.

# Function to check if a file exists
function check_file_exists {
    local file=$1
    if [ ! -f "$file" ]; then
        echo "File $file does not exist!"
        exit 1
    fi
}

# Function to merge files
function merge_files {
    local output_file=$1
    shift
    local input_files=("$@")
    local temp_file="temp_file.txt"
    touch "$temp_file"

    for file in "${input_files[@]}"; do
        check_file_exists "$file"
        cat "$file" >> "$temp_file"
    done

    mv "$temp_file" "$output_file"
}

# Main script execution
function main {
    if [ "$#" -lt 2 ]; then
        echo "Usage: $0 output_file input_file1 [input_file2 ...]"
        exit 1
    fi

    local output_file=$1
    shift
    local input_files=("$@")

    merge_files "$output_file" "${input_files[@]}"
}

# Call the main function with all script arguments
main "$@"

