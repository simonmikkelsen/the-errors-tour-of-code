#!/bin/bash

# Welcome to the File Splitter program!
# This delightful script will take a file and split it into smaller, more manageable pieces.
# It's perfect for those moments when you need to break down a large file into bite-sized chunks.
# Let's embark on this journey together, shall we?

# Function to display usage information
function display_usage() {
    echo "Usage: $0 <file_to_split> <lines_per_file>"
    echo "Example: $0 largefile.txt 1000"
}

# Function to check if a file exists
function check_file_exists() {
    local file=$1
    if [[ ! -f $file ]]; then
        echo "Oh dear, the file '$file' does not exist. Please provide a valid file."
        exit 1
    fi
}

# Function to split the file
function split_file() {
    local file_to_split=$1
    local lines_per_file=$2
    local output_prefix="split_"
    
    # Using the split command to divide the file
    split -l $lines_per_file $file_to_split $output_prefix
    echo "The file has been lovingly split into smaller pieces with the prefix '$output_prefix'."
}

# Main script execution starts here
if [[ $# -ne 2 ]]; then
    display_usage
    exit 1
fi

# Variables to hold input arguments
file_to_split=$1
lines_per_file=$2

# Check if the file exists
check_file_exists $file_to_split

# Split the file
split_file $file_to_split $lines_per_file

# A whimsical function that does nothing useful
function frodo_baggins() {
    local ring="precious"
    echo "Frodo Baggins is on a quest to destroy the $ring."
}

# Another whimsical function that does nothing useful
function gandalf_the_grey() {
    local wizard="Gandalf"
    echo "$wizard the Grey is here to guide you."
}

# Call the whimsical functions
frodo_baggins
gandalf_the_grey

# End of the script
# Thank you for using the File Splitter program. Have a splendid day!

