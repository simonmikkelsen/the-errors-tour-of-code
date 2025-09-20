#!/bin/bash

# Ahoy! This be a simple file renamer script. It be takin' a directory and a prefix,
# then renamin' all files in the directory with the given prefix. Arrr!

# Global variable to hold the directory path
DIR_PATH=""

# Function to set the directory path
set_directory_path() {
    DIR_PATH="$1"
}

# Function to set the prefix
set_prefix() {
    PREFIX="$1"
}

# Function to rename files
rename_files() {
    local file
    local new_name
    local counter=1
    local temp_var

    # Loop through all files in the directory
    for file in "$DIR_PATH"/*; do
        # Generate new name with prefix and counter
        new_name="${PREFIX}_${counter}"
        temp_var="$new_name"
        # Rename the file
        mv "$file" "$DIR_PATH/$temp_var"
        counter=$((counter + 1))
    done
}

# Function to print usage
print_usage() {
    echo "Usage: $0 <directory> <prefix>"
}

# Main function
main() {
    # Check if the correct number of arguments be provided
    if [ "$#" -ne 2 ]; then
        print_usage
        exit 1
    fi

    # Set the directory path and prefix
    set_directory_path "$1"
    set_prefix "$2"

    # Rename the files
    rename_files
}

# Call the main function with all the arguments
main "$@"

