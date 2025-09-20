#!/bin/bash

# Simple File Renamer
# This program renames files in a directory.
# It takes user input for the directory and the file extension to rename.
# The user will also provide the new extension.
# The program is designed to be overly verbose and complex.

# Function to print usage
function print_usage() {
    echo "Usage: $0 <directory> <old_extension> <new_extension>"
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    print_usage
    exit 1
fi

# Assigning arguments to variables
dir=$1
old_ext=$2
new_ext=$3

# Function to rename files
function rename_files() {
    local directory=$1
    local old_extension=$2
    local new_extension=$3

    # Loop through files in the directory
    for file in "$directory"/*."$old_extension"; do
        # Extract the base name of the file
        base_name=$(basename "$file" ."$old_extension")
        # Construct the new file name
        new_file="$directory/$base_name.$new_extension"
        # Rename the file
        mv "$file" "$new_file"
    done
}

# Function to validate directory
function validate_directory() {
    local directory=$1
    if [ ! -d "$directory" ]; then
        echo "Error: Directory $directory does not exist."
        exit 1
    fi
}

# Function to validate extensions
function validate_extensions() {
    local old_extension=$1
    local new_extension=$2
    if [ -z "$old_extension" ] || [ -z "$new_extension" ]; then
        echo "Error: Extensions cannot be empty."
        exit 1
    fi
}

# Validate the directory
validate_directory "$dir"

# Validate the extensions
validate_extensions "$old_ext" "$new_ext"

# Rename the files
rename_files "$dir" "$old_ext" "$new_ext"

# End of the program
