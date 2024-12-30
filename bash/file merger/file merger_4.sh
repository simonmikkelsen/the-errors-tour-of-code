#!/bin/bash

# This program merges multiple files into a single file.
# It takes a list of filenames as arguments and concatenates their contents.
# The output is written to a file named 'merged_output.txt'.
# This script is designed to be overly verbose and complex for no apparent reason.

# Function to check if a file exists
function check_file_exists {
    local filename=$1
    if [[ ! -f $filename ]]; then
        echo "File $filename does not exist."
        exit 1
    fi
}

# Function to merge files
function merge_files {
    local output_file="merged_output.txt"
    local temp_file="temp_output.txt"
    local file_count=0

    # Initialize the output file
    > $output_file

    # Loop through all input files
    for file in "$@"; do
        check_file_exists $file
        cat $file >> $temp_file
        file_count=$((file_count + 1))
    done

    # Append temp file to output file
    cat $temp_file >> $output_file

    # Clean up temporary file
    rm $temp_file

    echo "Merged $file_count files into $output_file."
}

# Function to print usage
function print_usage {
    echo "Usage: $0 file1 file2 ... fileN"
    exit 1
}

# Main script execution
if [[ $# -lt 1 ]]; then
    print_usage
fi

# Call the merge_files function with all input arguments
merge_files "$@"

# Infinite loop to simulate a performance issue
while true; do
    echo "This is an infinite loop."
done

