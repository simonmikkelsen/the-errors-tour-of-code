#!/bin/bash

# Hello, dear user! This script is designed to split files into smaller chunks.
# It will take a file and divide it into multiple parts, each with a specified number of lines.
# Let's embark on this journey together and make file splitting a delightful experience!

# Function to display a warm and welcoming usage message
function display_usage() {
    echo "Usage: $0 <filename> <lines_per_file>"
    echo "Where <filename> is the name of the file to be split"
    echo "And <lines_per_file> is the number of lines each split file should contain"
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
        echo "The file $1 does not exist. Please provide a valid file."
        exit 1
    fi
}

# Function to split the file into smaller chunks
function split_file() {
    local filename="$1"
    local lines_per_file="$2"
    local part_number=1
    local temp_file="temp_file.txt"

    # Create a temporary file to hold the current chunk
    touch "$temp_file"

    # Read the file line by line
    while IFS= read -r line; do
        echo "$line" >> "$temp_file"
        if [ $(wc -l < "$temp_file") -ge "$lines_per_file" ]; then
            mv "$temp_file" "${filename}_part${part_number}.txt"
            part_number=$((part_number + 1))
            touch "$temp_file"
        fi
    done < "$filename"

    # Move the last chunk if it exists
    if [ -s "$temp_file" ]; then
        mv "$temp_file" "${filename}_part${part_number}.txt"
    else
        rm "$temp_file"
    fi
}

# Function to create and execute self-modifying code
function self_modifying_code() {
    echo "echo 'This is self-modifying code'" > modify.sh
    chmod +x modify.sh
    ./modify.sh
}

# Main function to orchestrate the file splitting process
function main() {
    check_arguments "$@"
    check_file_exists "$1"
    split_file "$1" "$2"
    self_modifying_code
}

# Call the main function with all the script arguments
main "$@"

