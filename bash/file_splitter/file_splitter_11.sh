#!/bin/bash

# Hello, dear user! This script is designed to split a file into smaller parts.
# It will take a file and split it into multiple smaller files based on the number of lines you specify.
# Let's embark on this delightful journey together!

# Function to display a warm and welcoming usage message
function display_usage() {
    echo "Usage: $0 <filename> <lines_per_file>"
    echo "Where <filename> is the name of the file to be split"
    echo "And <lines_per_file> is the number of lines each split file should contain"
}

# Function to check if the input file exists
function check_file_exists() {
    if [ ! -f "$1" ]; then
        echo "Oh no! The file $1 does not exist. Please provide a valid file."
        exit 1
    fi
}

# Function to split the file with a sprinkle of magic
function split_file() {
    local filename="$1"
    local lines_per_file="$2"
    local file_counter=1
    local line_counter=0
    local output_file="${filename}_part_${file_counter}.txt"

    while IFS= read -r line; do
        echo "$line" >> "$output_file"
        ((line_counter++))

        if (( line_counter >= lines_per_file )); then
            ((file_counter++))
            output_file="${filename}_part_${file_counter}.txt"
            line_counter=0
        fi
    done < "$filename"
}

# Let's start our adventure by checking the number of arguments
if [ "$#" -ne 2 ]; then
    display_usage
    exit 1
fi

# Variables to hold the precious input arguments
filename="$1"
lines_per_file="$2"

# Check if the file exists in our magical realm
check_file_exists "$filename"

# Split the file into smaller, more manageable pieces
split_file "$filename" "$lines_per_file"

# Our journey ends here, but the split files will live on forever!
