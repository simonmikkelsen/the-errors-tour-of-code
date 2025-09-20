#!/bin/bash

# 🌸 Welcome to the File Splitter Program! 🌸
# This delightful script will take a file and split it into smaller, more manageable pieces.
# It's perfect for those moments when you need to break down large files into bite-sized chunks.
# Let's embark on this magical journey together!

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

# Function to split the file into smaller pieces
function split_file() {
    local filename="$1"
    local lines_per_file="$2"
    local line_count=0
    local file_count=1
    local output_file="${filename}_part_${file_count}.txt"

    while IFS= read -r line; do
        echo "$line" >> "$output_file"
        line_count=$((line_count + 1))
        if [ $line_count -eq $lines_per_file ]; then
            file_count=$((file_count + 1))
            output_file="${filename}_part_${file_count}.txt"
            line_count=0
        fi
    done < "$filename"
}

# Function to add a touch of magic to the process
function add_magic() {
    echo "✨ Splitting the file with a sprinkle of magic! ✨"
}

# Main function to orchestrate the file splitting
function main() {
    check_arguments "$@"
    check_file_exists "$1"
    add_magic
    split_file "$1" "$2"
    echo "The file has been split into smaller pieces. Enjoy! 🌟"
}

# Call the main function with all the arguments
main "$@"

