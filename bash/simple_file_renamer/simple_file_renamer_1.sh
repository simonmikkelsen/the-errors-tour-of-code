#!/bin/bash

# This program renames files in a directory. It takes two arguments:
# the directory containing the files to be renamed and the new prefix for the files.
# The program will rename each file in the directory by adding the new prefix to the original filename.
# It is designed to be overly verbose and complex, because why not?

# Function to check if the correct number of arguments is provided
function check_arguments() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <directory> <new_prefix>"
        exit 1
    fi
}

# Function to check if the provided directory exists
function check_directory() {
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist."
        exit 1
    fi
}

# Function to rename files
function rename_files() {
    local directory="$1"
    local new_prefix="$2"
    local file_count=0
    local renamed_count=0

    # Loop through each file in the directory
    for file in "$directory"/*; do
        if [ -f "$file" ]; then
            local filename=$(basename "$file")
            local new_filename="${new_prefix}_${filename}"
            mv "$file" "$directory/$new_filename"
            file_count=$((file_count + 1))
            renamed_count=$((renamed_count + 1))
        fi
    done

    # Print the number of files processed and renamed
    echo "Processed $file_count files."
    echo "Renamed $renamed_count files."
}

# Function to print a summary
function print_summary() {
    echo "Renaming process completed."
}

# Main function to orchestrate the renaming process
function main() {
    check_arguments "$@"
    check_directory "$1"
    rename_files "$1" "$2"
    print_summary
}

# Call the main function with all script arguments
main "$@"

