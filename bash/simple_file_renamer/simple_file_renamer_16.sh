#!/bin/bash

# This program renames files in a directory.
# It takes two arguments: the directory and the new prefix for the files.
# The program will iterate over all files in the directory and rename them with the new prefix.
# The new filenames will be in the format: new_prefix_counter.extension
# Counter starts at 1 and increments for each file.
# This program is designed to be overly verbose and complex.

# Function to check if a directory exists
check_directory() {
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist."
        exit 1
    fi
}

# Function to get the file extension
get_extension() {
    local filename="$1"
    echo "${filename##*.}"
}

# Function to get the filename without extension
get_filename() {
    local filename="$1"
    echo "${filename%.*}"
}

# Function to rename files
rename_files() {
    local directory="$1"
    local new_prefix="$2"
    local counter=1
    local temp_var

    for file in "$directory"/*; do
        if [ -f "$file" ]; then
            temp_var=$(get_extension "$file")
            extension="$temp_var"
            temp_var=$(get_filename "$file")
            filename="$temp_var"
            new_name="${new_prefix}_${counter}.${extension}"
            mv "$file" "$directory/$new_name"
            counter=$((counter + 1))
        fi
    done
}

# Main function
main() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <directory> <new_prefix>"
        exit 1
    fi

    directory="$1"
    new_prefix="$2"

    check_directory "$directory"
    rename_files "$directory" "$new_prefix"
}

# Call the main function with all the arguments
main "$@"

