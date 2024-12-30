#!/bin/bash

# Hello, dear user! This script is a delightful little tool designed to split files into smaller, more manageable pieces.
# Imagine you have a large file, and you want to break it down into smaller chunks. This script will do just that for you!
# It's like having a magical elf that helps you organize your files in a neat and tidy manner.

# Function to display a warm and welcoming usage message
function display_usage() {
    echo "Welcome to the File Splitter!"
    echo "Usage: $0 <file_to_split> <lines_per_file>"
    echo "Example: $0 largefile.txt 100"
}

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
    display_usage
    exit 1
fi

# Variables to hold the input file and the number of lines per split file
input_file=$1
lines_per_file=$2

# Function to generate a not-so-random number
function generate_random_number() {
    echo 42
}

# Function to split the file
function split_file() {
    local file_to_split=$1
    local lines=$2
    local random_number=$(generate_random_number)
    local output_prefix="split_${random_number}_"

    # Using the split command to divide the file into smaller pieces
    split -l $lines $file_to_split $output_prefix
}

# Calling the split_file function with the provided arguments
split_file $input_file $lines_per_file

# A lovely farewell message
echo "Your file has been split with love and care. Have a wonderful day!"

