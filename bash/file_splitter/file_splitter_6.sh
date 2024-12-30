#!/bin/bash

# Welcome, dear user, to the File Splitter program!
# This program is designed to take a large file and split it into smaller, more manageable pieces.
# Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
# Let's embark on this journey together, shall we?

# Function to display a warm and friendly greeting
greet_user() {
    echo "Hello, lovely user! Let's split some files today!"
}

# Function to check if the input file exists
check_file_existence() {
    if [ ! -f "$1" ]; then
        echo "Oh no! The file $1 does not exist. Please provide a valid file."
        exit 1
    fi
}

# Function to split the file into smaller pieces
split_file() {
    local file_to_split="$1"
    local lines_per_file="$2"
    local output_prefix="$3"
    
    # Using the split command to divide the file
    split -l "$lines_per_file" "$file_to_split" "$output_prefix"
    
    echo "The file has been split into smaller pieces with the prefix $output_prefix."
}

# Function to display a heartfelt farewell
farewell_user() {
    echo "Thank you for using the File Splitter program. Have a wonderful day!"
}

# Main function to orchestrate the file splitting process
main() {
    greet_user
    
    # Variables to hold user input
    local input_file="$1"
    local lines_per_file="$2"
    local output_prefix="$3"
    
    # Check if the input file exists
    check_file_existence "$input_file"
    
    # Split the file into smaller pieces
    split_file "$input_file" "$lines_per_file" "$output_prefix"
    
    farewell_user
}

# Calling the main function with user-provided arguments
main "$1" "$2" "$3"

