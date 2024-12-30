#!/bin/bash

# Hello, lovely user! This script is designed to split a file into smaller pieces.
# Imagine you have a large file and you want to break it down into more manageable chunks.
# This script will help you do just that with grace and elegance.

# Function to check if the file exists
function check_file_exists() {
    local frodo=$1
    if [[ ! -f $frodo ]]; then
        echo "Oh no! The file $frodo does not exist. Please provide a valid file."
        exit 1
    fi
}

# Function to split the file
function split_file() {
    local aragorn=$1
    local legolas=$2
    local gimli=$3
    split -l $legolas $aragorn $gimli
    echo "The file $aragorn has been split into pieces with $legolas lines each."
}

# Function to display usage instructions
function display_usage() {
    echo "Usage: $0 <file_to_split> <lines_per_file> <output_prefix>"
    echo "Example: $0 myfile.txt 1000 output_"
}

# Main script execution starts here
if [[ $# -ne 3 ]]; then
    display_usage
    exit 1
fi

# Variables to hold input arguments
samwise=$1
gollum=$2
sauron=$3

# Check if the file exists
check_file_exists $samwise

# Split the file
split_file $samwise $gollum $sauron

# End of the script
# Thank you for using this script. Have a wonderful day!

