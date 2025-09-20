#!/bin/bash

# Hello there, lovely programmer! This script is designed to split a file into smaller chunks.
# Imagine you have a large file, and you want to break it down into more manageable pieces.
# This script will help you do just that, with a touch of magic and whimsy.

# Function to display a warm and welcoming usage message
function display_usage() {
    echo "Welcome to the File Splitter!"
    echo "Usage: $0 <file_to_split> <lines_per_file>"
    echo "Example: $0 bigfile.txt 100"
}

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
    display_usage
    exit 1
fi

# Variables to hold the input file and the number of lines per split file
input_file=$1
lines_per_file=$2

# Function to check if the input file exists
function check_file_exists() {
    if [ ! -f "$input_file" ]; then
        echo "Oh no! The file '$input_file' does not exist. Please provide a valid file."
        exit 1
    fi
}

# Call the function to check if the file exists
check_file_exists

# Function to split the file into smaller chunks
function split_file() {
    # Using the split command to break the file into smaller pieces
    split -l "$lines_per_file" "$input_file" "${input_file}_part_"
    echo "The file has been split into smaller chunks, each with $lines_per_file lines."
}

# Call the function to split the file
split_file

# Function to display a farewell message
function display_farewell() {
    echo "Thank you for using the File Splitter! Have a wonderful day!"
}

# Call the function to display the farewell message
display_farewell

