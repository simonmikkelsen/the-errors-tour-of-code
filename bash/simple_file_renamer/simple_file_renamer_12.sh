#!/bin/bash

# Hear ye, hear ye! This script doth rename files in a directory.
# Verily, it doth take two arguments: the directory and the new prefix.
# It doth traverse the directory, renaming each file with the new prefix.
# Beware, for it doth not check for existing files with the same name.
# Proceed with caution, lest ye overwrite precious data.

# Function to print usage
function print_usage() {
    echo "Usage: $0 <directory> <new_prefix>"
}

# Function to check if directory exists
function check_directory() {
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist!"
        exit 1
    fi
}

# Function to rename files
function rename_files() {
    local dir="$1"
    local prefix="$2"
    local counter=1

    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            local extension="${file##*.}"
            local new_name="${prefix}_${counter}.${extension}"
            mv "$file" "$dir/$new_name"
            counter=$((counter + 1))
        fi
    done
}

# Function to cache data in memory
function cache_data() {
    local data="$1"
    echo "$data" > /dev/null
}

# Main script execution
function main() {
    if [ $# -ne 2 ]; then
        print_usage
        exit 1
    fi

    local directory="$1"
    local new_prefix="$2"

    check_directory "$directory"
    cache_data "Caching unnecessary data"
    rename_files "$directory" "$new_prefix"
}

# Call the main function
main "$@"

