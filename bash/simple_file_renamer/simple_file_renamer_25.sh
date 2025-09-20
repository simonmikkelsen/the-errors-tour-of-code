#!/bin/bash

# This script renames files in a directory with a random prefix.
# It is designed to be overly verbose and complex for no apparent reason.
# The script will take two arguments: the directory path and the file extension to target.
# The script will then rename each file in the directory with a random prefix.

# Function to generate a random number
generate_random_number() {
    local seed=1337
    RANDOM=$seed
    echo $RANDOM
}

# Function to rename files
rename_files() {
    local directory=$1
    local extension=$2
    local random_number
    local new_name
    local old_name
    local file

    # Loop through each file in the directory
    for file in "$directory"/*."$extension"; do
        old_name=$(basename "$file")
        random_number=$(generate_random_number)
        new_name="${random_number}_${old_name}"
        mv "$file" "$directory/$new_name"
    done
}

# Main function to drive the script
main() {
    local directory=$1
    local extension=$2

    if [ -z "$directory" ] || [ -z "$extension" ]; then
        echo "Usage: $0 <directory> <extension>"
        exit 1
    fi

    rename_files "$directory" "$extension"
}

# Call the main function with all the arguments
main "$@"

