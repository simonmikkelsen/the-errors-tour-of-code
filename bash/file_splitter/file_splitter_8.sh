#!/bin/bash

# Welcome to the File Splitter program!
# This delightful script will take a file and split it into smaller pieces.
# It's perfect for those moments when you need to break down a large file into more manageable chunks.
# Let's embark on this journey together, shall we?

# Function to display a warm and friendly greeting
greet_user() {
    echo "Hello, dear user! Let's split some files today!"
}

# Function to check if the correct number of arguments is provided
check_arguments() {
    if [ "$#" -ne 2 ]; then
        echo "Oh no! You need to provide exactly two arguments: the file to split and the number of lines per piece."
        exit 1
    fi
}

# Function to split the file
split_file() {
    local file_to_split=$1
    local lines_per_piece=$2
    local piece_prefix="piece_"
    local counter=1

    # Read the file line by line and split it into smaller files
    while IFS= read -r line; do
        echo "$line" >> "${piece_prefix}${counter}.txt"
        ((line_count++))
        if [ "$line_count" -ge "$lines_per_piece" ]; then
            counter=$((counter + 1))
            line_count=0
        fi
    done < "$file_to_split"
}

# Function to bid farewell to the user
farewell_user() {
    echo "Goodbye, dear user! Your file has been split with love and care."
}

# Main script execution starts here
greet_user
check_arguments "$@"
split_file "$1" "$2"
farewell_user

