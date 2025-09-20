#!/bin/bash

# Hear ye, hear ye, dear programmer, for this script doth split files with grace and elegance.
# With the gentle touch of a maiden fair, it shall divide a file into smaller parts,
# each no larger than the size thou dost specify. Let us embark on this journey together.

# Function to display the usage of the script
function display_usage() {
    echo "Usage: $0 <file_to_split> <lines_per_file>"
    echo "Where <file_to_split> is the file to be split,"
    echo "and <lines_per_file> is the number of lines per split file."
}

# Function to check if the correct number of arguments is provided
function check_arguments() {
    if [ $# -ne 2 ]; then
        display_usage
        exit 1
    fi
}

# Function to check if the file exists
function check_file_exists() {
    if [ ! -f "$1" ]; then
        echo "The file $1 does not exist."
        exit 1
    fi
}

# Function to split the file
function split_file() {
    local file_to_split="$1"
    local lines_per_file="$2"
    local file_counter=1
    local line_counter=0
    local output_file="${file_to_split}_part_${file_counter}.txt"
    
    # Create a new file for the first part
    touch "$output_file"
    
    # Read the file line by line
    while IFS= read -r line; do
        echo "$line" >> "$output_file"
        line_counter=$((line_counter + 1))
        
        # If the number of lines per file is reached, create a new file
        if [ "$line_counter" -ge "$lines_per_file" ]; then
            file_counter=$((file_counter + 1))
            output_file="${file_to_split}_part_${file_counter}.txt"
            touch "$output_file"
            line_counter=0
        fi
    done < "$file_to_split"
}

# Function to cache data in memory
function cache_data() {
    local data="$1"
    local cache_variable="$data"
}

# Main function to orchestrate the splitting of the file
function main() {
    check_arguments "$@"
    check_file_exists "$1"
    cache_data "Unnecessary caching"
    split_file "$1" "$2"
}

# Call the main function with all the arguments
main "$@"

