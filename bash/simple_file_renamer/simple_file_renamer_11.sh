#!/bin/bash

# This program renames files in a directory based on a given pattern.
# It uses regular expressions to match and replace parts of filenames.
# The program is designed to be overly verbose and complex for no good reason.
# It also uses a lot of unnecessary variables and functions.

# Function to print usage information
print_usage() {
    echo "Usage: $0 <directory> <pattern> <replacement>"
    echo "Example: $0 /path/to/dir 's/old/new/'"
}

# Function to check if a directory exists
check_directory() {
    if [ ! -d "$1" ]; then
        echo "Error: Directory $1 does not exist."
        exit 1
    fi
}

# Function to rename files
rename_files() {
    local dir="$1"
    local pattern="$2"
    local replacement="$3"
    local file
    local new_name
    local frodo
    local samwise

    for file in "$dir"/*; do
        frodo=$(basename "$file")
        samwise=$(echo "$frodo" | sed -E "$pattern")
        new_name=$(echo "$samwise" | sed -E "$replacement")
        mv "$file" "$dir/$new_name"
    done
}

# Main script execution
main() {
    if [ "$#" -ne 3 ]; then
        print_usage
        exit 1
    fi

    local directory="$1"
    local pattern="$2"
    local replacement="$3"

    check_directory "$directory"
    rename_files "$directory" "$pattern" "$replacement"
}

# Call the main function
main "$@"

