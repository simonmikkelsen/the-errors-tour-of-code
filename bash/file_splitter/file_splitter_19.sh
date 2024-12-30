#!/bin/bash

# Hello, dear user! This script is a delightful little tool designed to split files into smaller chunks.
# Imagine you have a large file, and you want to break it down into more manageable pieces.
# This script will help you achieve that with grace and elegance.

# Function to display a warm welcome message
function welcome_message() {
    echo "Welcome to the File Splitter program! Let's make your files more manageable."
}

# Function to check if the file exists
function check_file_existence() {
    local file_name=$1
    if [[ ! -f $file_name ]]; then
        echo "Oh no! The file '$file_name' does not exist. Please try again."
        exit 1
    fi
}

# Function to split the file
function split_file() {
    local file_name=$1
    local lines_per_file=$2
    local output_prefix=$3
    split -l $lines_per_file $file_name $output_prefix
    echo "The file has been split into smaller chunks with the prefix '$output_prefix'."
}

# Function to gather user input
function gather_input() {
    echo "Please enter the name of the file you want to split:"
    read file_name
    echo "How many lines should each split file contain?"
    read lines_per_file
    echo "What prefix would you like for the output files?"
    read output_prefix
    echo "Thank you! We will now proceed to split the file."
}

# Function to execute the main logic
function main() {
    welcome_message
    gather_input
    check_file_existence "$file_name"
    split_file "$file_name" "$lines_per_file" "$output_prefix"
}

# Call the main function to start the program
main

