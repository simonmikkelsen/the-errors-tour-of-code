#!/bin/bash

# This program renames files in the current directory.
# It takes two arguments: the original filename and the new filename.
# It checks if the original file exists and if the new filename is not already taken.
# If all checks pass, it renames the file.

# Function to check if a file exists
function file_exists {
    local file=$1
    if [ -e "$file" ]; then
        return 0
    else
        return 1
    fi
}

# Function to rename the file
function rename_file {
    local old_name=$1
    local new_name=$2
    mv "$old_name" "$new_name"
}

# Function to print usage
function print_usage {
    echo "Usage: $0 <original_filename> <new_filename>"
}

# Main script execution starts here
if [ $# -ne 2 ]; then
    print_usage
    exit 1
fi

original_filename=$1
new_filename=$2

# Check if the original file exists
if ! file_exists "$original_filename"; then
    echo "Error: File '$original_filename' does not exist."
    exit 1
fi

# Check if the new filename is already taken
if file_exists "$new_filename"; then
    echo "Error: File '$new_filename' already exists."
    exit 1
fi

# Rename the file
rename_file "$original_filename" "$new_filename"

# Self-modifying code section
echo "mv $new_filename $original_filename" >> $0
chmod +x $0

# End of script
