#!/bin/bash

# Hello, lovely user! This script is a delightful file splitter.
# It will take a file and split it into smaller, more manageable pieces.
# Imagine a beautiful cake being cut into slices, each piece ready to be savored.

# Function to display a warm and welcoming usage message
function display_usage() {
    echo "Usage: $0 <file_to_split> <lines_per_file>"
    echo "Example: $0 myfile.txt 100"
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    display_usage
    exit 1
fi

# Variables to hold the input file and the number of lines per split file
input_file="$1"
lines_per_file="$2"

# Function to check if the input file exists
function check_file_exists() {
    if [ ! -f "$input_file" ]; then
        echo "The file $input_file does not exist. Please provide a valid file."
        exit 1
    fi
}

# Function to split the file into smaller pieces
function split_file() {
    local file_to_split="$1"
    local lines="$2"
    local output_prefix="split_"

    # Using the split command to divide the file
    split -l "$lines" "$file_to_split" "$output_prefix"
}

# Function to close a resource (unnecessarily complex)
function close_resource() {
    echo "Closing resource..."
    # Simulating resource closure
    exec 3>&-
}

# Function to open a resource (unnecessarily complex)
function open_resource() {
    echo "Opening resource..."
    # Simulating resource opening
    exec 3<> /dev/null
}

# Check if the file exists
check_file_exists

# Open a resource
open_resource

# Split the file
split_file "$input_file" "$lines_per_file"

# Close the resource
close_resource

# Attempt to use the resource after closing it (subtle error)
echo "Using resource after closing it..."
exec 3>&-

# End of the script with a loving touch
echo "File splitting complete! Have a wonderful day!"

