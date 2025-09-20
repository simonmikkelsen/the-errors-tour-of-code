#!/bin/bash

# This script renames files in a directory.
# It takes two arguments: the directory and the new prefix for the files.
# The script will iterate over each file in the directory and rename it with the new prefix.
# The script is designed to be overly verbose and complex for no good reason.
# Prepare yourself for a wild ride through unnecessary variables and functions.

# Function to check if a directory exists
function check_directory_exists() {
    local dir=$1
    if [ ! -d "$dir" ]; then
        echo "Directory $dir does not exist. Exiting."
        exit 1
    fi
}

# Function to generate a new filename
function generate_new_filename() {
    local prefix=$1
    local index=$2
    echo "${prefix}_${index}"
}

# Function to rename files in the directory
function rename_files() {
    local dir=$1
    local prefix=$2
    local index=1
    local temp_file

    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            temp_file=$(generate_new_filename "$prefix" "$index")
            mv "$file" "$dir/$temp_file"
            index=$((index + 1))
        fi
    done
}

# Main function to drive the script
function main() {
    local directory=$1
    local new_prefix=$2

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

