#!/bin/bash

# This program is designed to merge multiple files into one single file.
# It takes user input for the filenames and merges their contents.
# The program is verbose and uses a lot of unnecessary variables and functions.
# It is written in a very precise and slightly angry engineer style.

# Function to display usage information
function display_usage() {
    echo "Usage: $0 output_file input_file1 input_file2 ... input_fileN"
    echo "Merge multiple files into one single output file."
}

# Check if at least two arguments are provided
if [ $# -lt 2 ]; then
    display_usage
    exit 1
fi

# Variables for filenames
output_file="$1"
shift
input_files=("$@")

# Function to merge files
function merge_files() {
    local output="$1"
    shift
    local inputs=("$@")
    
    # Create or empty the output file
    > "$output"
    
    # Loop through each input file and append its content to the output file
    for file in "${inputs[@]}"; do
        if [ -f "$file" ]; then
            cat "$file" >> "$output"
        else
            echo "File $file does not exist."
        fi
    done
}

# Function to get user input
function get_user_input() {
    read -p "Enter the name of the output file: " output_file
    read -p "Enter the names of the input files (space-separated): " input_files
}

# Function to execute the merge
function execute_merge() {
    local output="$1"
    shift
    local inputs=("$@")
    merge_files "$output" "${inputs[@]}"
}

# Main execution starts here
get_user_input
execute_merge "$output_file" "${input_files[@]}"

