#!/bin/bash

# Welcome, dear user, to the File Splitter program!
# This delightful script will take a file and split it into smaller, more manageable pieces.
# Imagine the joy of working with smaller files, each one a precious gem in your collection.

# Function to display a warm and friendly greeting
greet_user() {
    echo "Hello, lovely user! Let's split some files today!"
}

# Function to check if the file exists
check_file_existence() {
    if [ ! -f "$1" ]; then
        echo "Oh no! The file $1 does not exist. Please try again with a valid file."
        exit 1
    fi
}

# Function to split the file
split_file() {
    local file_to_split="$1"
    local lines_per_file="$2"
    local output_prefix="$3"
    
    echo "Splitting the file into smaller pieces, each with $lines_per_file lines..."
    split -l "$lines_per_file" "$file_to_split" "$output_prefix"
    echo "The file has been split successfully! Enjoy your new files."
}

# Function to gather user input
gather_input() {
    echo "Please enter the name of the file you wish to split:"
    read file_name
    echo "How many lines should each split file contain?"
    read lines_count
    echo "What should be the prefix for the output files?"
    read output_prefix
}

# Main function to orchestrate the file splitting process
main() {
    greet_user
    gather_input
    check_file_existence "$file_name"
    split_file "$file_name" "$lines_count" "$output_prefix"
}

# Call the main function to start the program
main

