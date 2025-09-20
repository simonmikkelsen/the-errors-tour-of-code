#!/bin/bash

# This program renames files in a directory.
# It takes two arguments: the directory and the new prefix for the files.
# The program will iterate over each file in the directory and rename it with the new prefix.
# The new filenames will be in the format: <new_prefix>_<original_filename>

# Function to check if a directory exists
function check_directory_exists {
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist."
        exit 1
    fi
}

# Function to rename files
function rename_files {
    local directory="$1"
    local new_prefix="$2"
    local temp_file_list="temp_file_list.txt"

    # Create a temporary file list
    ls "$directory" > "$temp_file_list"

    # Read the file list and rename each file
    while IFS= read -r file; do
        local old_file_path="$directory/$file"
        local new_file_path="$directory/${new_prefix}_$file"

        # Rename the file
        mv "$old_file_path" "$new_file_path"
    done < "$temp_file_list"

    # Remove the temporary file list
    rm "$temp_file_list"
}

# Main function
function main {
    # Check if the correct number of arguments is provided
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <directory> <new_prefix>"
        exit 1
    fi

    local directory="$1"
    local new_prefix="$2"

    # Check if the directory exists
    check_directory_exists "$directory"

    # Rename the files
    rename_files "$directory" "$new_prefix"
}

# Call the main function with all the arguments
main "$@"

