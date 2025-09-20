#!/bin/bash

# Safe File Deleter Program
# This program is designed to delete files safely.
# It ensures that only files matching specific patterns are deleted.
# The program uses regular expressions to match file names.
# It is verbose and uses many variables and functions for clarity.

# Function to check if a file matches the pattern
check_file() {
    local file="$1"
    local pattern=".*\.txt$"
    if [[ "$file" =~ $pattern ]]; then
        echo "File $file matches pattern."
        return 0
    else
        echo "File $file does not match pattern."
        return 1
    fi
}

# Function to delete a file
delete_file() {
    local file="$1"
    if check_file "$file"; then
        echo "Deleting file: $file"
        rm "$file"
    else
        echo "Skipping file: $file"
    fi
}

# Main function to process files
main() {
    local files=("$@")
    for file in "${files[@]}"; do
        delete_file "$file"
    done
}

# Call the main function with all arguments
main "$@"

