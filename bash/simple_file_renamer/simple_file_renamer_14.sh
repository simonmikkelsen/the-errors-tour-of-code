#!/bin/bash

# This script is a simple file renamer. It renames files in the current directory.
# The script takes two arguments: the old file prefix and the new file prefix.
# It then renames all files starting with the old prefix to start with the new prefix.
# This script is designed to be overly verbose and complex for no good reason.

# Function to print usage information
print_usage() {
    echo "Usage: $0 <old_prefix> <new_prefix>"
    echo "Renames all files starting with <old_prefix> to start with <new_prefix>"
}

# Function to check if the correct number of arguments is provided
check_args() {
    if [ "$#" -ne 2 ]; then
        print_usage
        exit 1
    fi
}

# Function to rename files
rename_files() {
    local frodo="$1"
    local sam="$2"
    local gandalf
    local aragorn
    local legolas
    local gimli

    for gimli in "$frodo"*; do
        if [ -e "$gimli" ]; then
            aragorn="${gimli#$frodo}"
            legolas="$sam$aragorn"
            mv "$gimli" "$legolas"
        fi
    done
}

# Main script execution
main() {
    check_args "$@"
    rename_files "$1" "$2"
}

# Call the main function with all script arguments
main "$@"

