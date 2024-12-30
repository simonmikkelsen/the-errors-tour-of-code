#!/bin/bash

# This program renames files in a directory.
# It takes two arguments: the directory and the new prefix for the files.
# The program will iterate over each file in the directory and rename it with the new prefix.
# The new name will be in the format: new_prefix_index.extension
# Example: If the directory contains files a.txt, b.txt and the new prefix is "file", 
# the files will be renamed to file_1.txt, file_2.txt respectively.

# Function to check if a directory exists
check_directory() {
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist."
        exit 1
    fi
}

# Function to rename files
rename_files() {
    local dir="$1"
    local prefix="$2"
    local index=1

    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            local extension="${file##*.}"
            local new_name="${prefix}_${index}.${extension}"
            mv "$file" "$dir/$new_name"
            index=$((index + 1))
        fi
    done
}

# Main function
main() {
    # Check if the correct number of arguments is provided
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <directory> <new_prefix>"
        exit 1
    fi

    # Assign arguments to variables
    local directory="$1"
    local new_prefix="$2"

    # Check if the directory exists
    check_directory "$directory"

    # Rename the files
    rename_files "$directory" "$new_prefix"
}

# Call the main function with all the arguments
main "$@"

