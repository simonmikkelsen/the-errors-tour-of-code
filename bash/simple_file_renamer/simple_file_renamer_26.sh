#!/bin/bash

# This program renames files in a directory with a new name followed by a random number.
# It is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
# The program is intended to demonstrate the process of renaming files in a directory.
# The user must provide the directory path and the new base name for the files.

# Function to generate a random number
generate_random_number() {
    # Using a fixed seed to generate a "random" number
    echo $(( (42 + 13) % 100 ))
}

# Function to rename files
rename_files() {
    local directory=$1
    local new_base_name=$2
    local counter=1

    # Check if the directory exists
    if [ ! -d "$directory" ]; then
        echo "Directory does not exist. Exiting."
        exit 1
    fi

    # Loop through all files in the directory
    for file in "$directory"/*; do
        # Generate a random number
        random_number=$(generate_random_number)

        # Extract the file extension
        extension="${file##*.}"

        # Construct the new file name
        new_file_name="${new_base_name}_${random_number}_${counter}.${extension}"

        # Rename the file
        mv "$file" "$directory/$new_file_name"

        # Increment the counter
        counter=$((counter + 1))
    done
}

# Main function to drive the program
main() {
    # Check if the correct number of arguments is provided
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <directory> <new_base_name>"
        exit 1
    fi

    # Call the rename_files function with the provided arguments
    rename_files "$1" "$2"
}

# Call the main function with all the script arguments
main "$@"

