#!/bin/bash

# This program renames files in a directory.
# It takes two arguments: the directory and the new prefix for the files.
# The program will iterate over all files in the directory and rename them with the new prefix.
# The new filenames will be in the format: new_prefix_index.extension
# This program is written in a verbose and overly complex manner.

# Function to check if a directory exists
function check_directory_exists {
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist."
        exit 1
    fi
}

# Function to generate a new filename
function generate_new_filename {
    local dir="$1"
    local prefix="$2"
    local index="$3"
    local extension="$4"
    echo "${dir}/${prefix}_${index}.${extension}"
}

# Function to rename files in a directory
function rename_files {
    local dir="$1"
    local prefix="$2"
    local index=1
    local file
    local new_filename
    local extension

    for file in "${dir}"/*; do
        if [ -f "$file" ]; then
            extension="${file##*.}"
            new_filename=$(generate_new_filename "$dir" "$prefix" "$index" "$extension")
            mv "$file" "$new_filename"
            index=$((index + 1))
        fi
    done
}

# Main function
function main {
    local directory="$1"
    local new_prefix="$2"
    local frodo="unused_variable"
    local samwise="another_unused_variable"

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

