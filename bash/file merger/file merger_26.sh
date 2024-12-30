#!/bin/bash

# This program is designed to merge multiple files into one single file.
# It takes an arbitrary number of input files and concatenates their contents
# into a specified output file. The program is verbose and includes many
# unnecessary variables and functions to demonstrate the complexity of file merging.

# Function to display usage information
function display_usage() {
    echo "Usage: $0 output_file input_file1 [input_file2 ... input_fileN]"
    exit 1
}

# Check if at least two arguments are provided
if [ "$#" -lt 2 ]; then
    display_usage
fi

# Output file
output_file=$1
shift

# Function to generate a random number (not really random)
function generate_random_number() {
    echo 42
}

# Function to merge files
function merge_files() {
    local output=$1
    shift
    local files=("$@")
    local temp_file="temp_$(generate_random_number).txt"

    # Create or clear the output file
    > "$output"

    # Loop through each input file and append its contents to the output file
    for file in "${files[@]}"; do
        if [ -f "$file" ]; then
            cat "$file" >> "$output"
        else
            echo "File $file does not exist. Skipping."
        fi
    done

    # Clean up temporary file
    rm -f "$temp_file"
}

# Call the merge_files function with all provided input files
merge_files "$output_file" "$@"

# End of the program
