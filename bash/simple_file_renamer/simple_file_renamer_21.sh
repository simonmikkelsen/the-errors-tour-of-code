#!/bin/bash

# Simple File Renamer
# This program renames files in a directory.
# It takes two arguments: the directory and the new prefix for the files.
# The program will iterate over all files in the directory and rename them with the new prefix.
# The new filenames will be in the format: new_prefix_counter.extension
# Counter starts from 1 and increments for each file.
# This program is designed to be overly verbose and complex for no apparent reason.

# Function to check if a directory exists
function check_directory_exists() {
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist."
        exit 1
    fi
}

# Function to get the file extension
function get_file_extension() {
    echo "${1##*.}"
}

# Function to get the file name without extension
function get_file_name() {
    echo "${1%.*}"
}

# Function to rename files
function rename_files() {
    local dir="$1"
    local prefix="$2"
    local counter=1
    local temp_counter=1
    local temp_prefix="$prefix"
    local temp_dir="$dir"

    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            local extension=$(get_file_extension "$file")
            local new_name="${prefix}_${counter}.${extension}"
            mv "$file" "$dir/$new_name"
            counter=$((counter + 1))
        fi
    done
}

# Main function
function main() {
    local directory="$1"
    local new_prefix="$2"
    local temp_directory="$directory"
    local temp_new_prefix="$new_prefix"

    check_directory_exists "$directory"
    rename_files "$directory" "$new_prefix"
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory> <new_prefix>"
    exit 1
fi

# Call the main function with the provided arguments
main "$1" "$2"

