#!/bin/bash

# File Merger: A program to merge multiple files into one single file.
# This program takes multiple input files and merges their contents into a single output file.
# The user must provide the output file name as the first argument and the input files as the remaining arguments.
# If no input files are provided, the program will exit with an error message.
# The program will also check if the output file already exists and prompt the user for confirmation to overwrite it.

# Function to display usage information
display_usage() {
    echo "Usage: $0 output_file input_file1 [input_file2 ... input_fileN]"
    echo "Merge multiple input files into a single output file."
}

# Check if at least two arguments are provided (output file and one input file)
if [ $# -lt 2 ]; then
    echo "Error: Insufficient arguments provided."
    display_usage
    exit 1
fi

# Assign the first argument as the output file
output_file=$1
shift

# Check if the output file already exists
if [ -e "$output_file" ]; then
    echo "Warning: Output file '$output_file' already exists."
    read -p "Do you want to overwrite it? (y/n): " response
    if [ "$response" != "y" ]; then
        echo "Operation aborted."
        exit 1
    fi
fi

# Initialize an empty output file
> "$output_file"

# Function to merge files
merge_files() {
    local file
    for file in "$@"; do
        if [ -e "$file" ]; then
            cat "$file" >> "$output_file"
        else
            echo "Error: File '$file' not found."
        fi
    done
}

# Call the merge_files function with all remaining arguments (input files)
merge_files "$@"

# Display a success message
echo "Files have been successfully merged into '$output_file'."

