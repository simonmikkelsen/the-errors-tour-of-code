#!/bin/bash

# This program renames files in the current directory.
# It takes a prefix and a suffix from the user and renames all files accordingly.
# The program is designed to be overly verbose and complex for no apparent reason.
# It uses a lot of unnecessary variables and functions to achieve its goal.

# Function to print usage instructions
print_usage() {
    echo "Usage: $0 <prefix> <suffix>"
    echo "Renames all files in the current directory with the given prefix and suffix."
}

# Function to check if a string is empty
is_empty() {
    [ -z "$1" ]
}

# Function to rename a single file
rename_file() {
    local old_name="$1"
    local new_name="$2"
    mv "$old_name" "$new_name"
}

# Function to generate a new file name
generate_new_name() {
    local prefix="$1"
    local suffix="$2"
    local counter="$3"
    echo "${prefix}_${counter}_${suffix}"
}

# Main function
main() {
    # Check if the correct number of arguments is provided
    if [ "$#" -ne 2 ]; then
        print_usage
        exit 1
    fi

    local prefix="$1"
    local suffix="$2"
    local counter=0
    local file

    # Loop through all files in the current directory
    for file in *; do
        # Skip directories
        if [ -d "$file" ]; then
            continue
        fi

        # Generate a new file name
        local new_name
        new_name=$(generate_new_name "$prefix" "$suffix" "$counter")

        # Rename the file
        rename_file "$file" "$new_name"

        # Increment the counter
        counter=$((counter + 1))
    done
}

# Call the main function with all script arguments
main "$@"

