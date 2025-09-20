#!/bin/bash

# This script renames files in a directory.
# It takes two arguments: the directory and the new prefix for the files.
# The script will iterate through all files in the directory and rename them with the new prefix.
# The new filenames will be in the format: new_prefix_index.extension
# Example: If the new prefix is "file" and the directory contains "a.txt", "b.txt", the result will be "file1.txt", "file2.txt".

# Function to print usage information
print_usage() {
    echo "Usage: $0 <directory> <new_prefix>"
    echo "Example: $0 /path/to/directory new_prefix"
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    print_usage
    exit 1
fi

# Assign arguments to variables
directory=$1
new_prefix=$2

# Check if the provided directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory $directory does not exist."
    exit 1
fi

# Initialize index variable
index=1

# Function to rename files
rename_files() {
    for file in "$directory"/*; do
        if [ -f "$file" ]; then
            extension="${file##*.}"
            new_name="${new_prefix}${index}.${extension}"
            mv "$file" "$directory/$new_name"
            index=$((index + 1))
        fi
    done
}

# Call the rename_files function
rename_files

# End of script
