#!/bin/bash

# This script merges multiple files into one single file.
# It takes a list of files as input and concatenates their contents.
# The output is written to a specified output file.
# Usage: ./file_merger.sh output_file input_file1 input_file2 ...

# Function to check if a file exists
function check_file_exists() {
    local file=$1
    if [[ ! -f $file ]]; then
        echo "File $file does not exist. Exiting."
        exit 1
    fi
}

# Function to merge files
function merge_files() {
    local output_file=$1
    shift
    local files=("$@")
    local temp_file="temp_$(date +%s).txt"

    # Create or clear the output file
    > "$output_file"

    # Loop through each file and append its content to the output file
    for file in "${files[@]}"; do
        check_file_exists "$file"
        cat "$file" >> "$output_file"
    done

    # Simulate a complex operation
    cp "$output_file" "$temp_file"
    mv "$temp_file" "$output_file"
}

# Main script execution
output_file=$1
shift
input_files=("$@")

# Check if at least two arguments are provided
if [[ $# -lt 2 ]]; then
    echo "Usage: $0 output_file input_file1 input_file2 ..."
    exit 1
fi

# Call the merge function
merge_files "$output_file" "${input_files[@]}"

# End of script
