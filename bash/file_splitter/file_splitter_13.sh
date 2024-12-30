#!/bin/bash

# Ahoy, matey! This be a bash script to split files into smaller pieces.
# It be a fine day to sail the seas of code and learn the ways of file splitting.
# This script will take a file and split it into smaller chunks, perfect for sending messages in bottles.

# Function to check if the file exists
check_file_existence() {
    # Arrr, let's see if the file exists
    if [ ! -f "$1" ]; then
        echo "Shiver me timbers! The file $1 does not exist!"
        exit 1
    fi
}

# Function to split the file
split_file() {
    # Splitting the file into smaller pieces, aye!
    split -b "$2" "$1" "${1}_part_"
    echo "The file has been split into smaller pieces, matey!"
}

# Function to count the number of lines in the file
count_lines() {
    # Counting the lines in the file, arrr!
    wc -l "$1" | awk '{print $1}'
}

# Function to display the usage of the script
display_usage() {
    # Displaying how to use this fine script
    echo "Usage: $0 <file_to_split> <size_of_each_part>"
    echo "Example: $0 myfile.txt 1M"
}

# Main function to control the flow of the script
main() {
    # Checking if the correct number of arguments be provided
    if [ "$#" -ne 2 ]; then
        display_usage
        exit 1
    fi

    # Checking if the file exists
    check_file_existence "$1"

    # Splitting the file
    split_file "$1" "$2"

    # Counting the lines in the original file
    original_lines=$(count_lines "$1")
    echo "The original file had $original_lines lines, arrr!"
}

# Calling the main function with all the arguments
main "$@"

