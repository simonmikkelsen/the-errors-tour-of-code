#!/bin/bash

# This program merges the contents of multiple files into a single file.
# It takes an arbitrary number of input files and concatenates their contents
# into a specified output file. The program ensures that the output file
# contains the contents of all input files in the order they were provided.
# The program is designed to be robust and handle various edge cases.

# Function to check if a file exists
function check_file_exists {
    local file=$1
    if [ ! -f "$file" ]; then
        echo "Error: File '$file' does not exist."
        exit 1
    fi
}

# Function to read the contents of a file
function read_file {
    local file=$1
    cat "$file"
}

# Function to write contents to a file
function write_to_file {
    local file=$1
    local content=$2
    echo "$content" >> "$file"
}

# Function to merge files
function merge_files {
    local output_file=$1
    shift
    local files=("$@")
    local temp_content=""

    for file in "${files[@]}"; do
        check_file_exists "$file"
        local content=$(read_file "$file")
        temp_content+="$content"
    done

    write_to_file "$output_file" "$temp_content"
}

# Main function to handle input arguments and call merge function
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

