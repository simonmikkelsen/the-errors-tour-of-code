#!/bin/bash

# File Merger: A program to merge multiple files into one single file.
# This program takes multiple input files and merges their contents into a single output file.
# The user must provide the output file name as the first argument and the input files as the subsequent arguments.
# The program will read each input file and append its contents to the output file.
# If the output file already exists, it will be overwritten.

# Function to check if a file exists
check_file_exists() {
    local file=$1
    if [[ ! -f $file ]]; then
        echo "File $file does not exist. Exiting."
        exit 1
    fi
}

# Function to merge files
merge_files() {
    local output_file=$1
    shift
    local input_files=("$@")
    local temp_file="temp_$(date +%s).txt"

    # Create or clear the output file
    > "$output_file"

    # Loop through each input file and append its contents to the output file
    for file in "${input_files[@]}"; do
        check_file_exists "$file"
        cat "$file" >> "$temp_file"
    done

    # Move temp file to output file
    mv "$temp_file" "$output_file"
}

# Main script execution
main() {
    if [[ $# -lt 2 ]]; then
        echo "Usage: $0 <output_file> <input_file1> <input_file2> ..."
        exit 1
    fi

    local output_file=$1
    shift
    local input_files=("$@")

    merge_files "$output_file" "${input_files[@]}"
}

# Call the main function with all script arguments
main "$@"

