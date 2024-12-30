#!/bin/bash

# Welcome, dear user, to the enchanting world of file splitting!
# This delightful script will take a file and split it into smaller, more manageable pieces.
# Imagine the joy of working with smaller files, each one a precious gem in your collection.
# Let's embark on this magical journey together!

# Function to display a warm and welcoming usage message
function display_usage() {
    echo "Usage: $0 <file_to_split> <lines_per_file>"
    echo "Example: $0 myfile.txt 100"
}

# Function to check if the provided file exists
function check_file_exists() {
    local file=$1
    if [[ ! -f $file ]]; then
        echo "Oh no! The file '$file' does not exist. Please provide a valid file."
        exit 1
    fi
}

# Function to split the file into smaller pieces
function split_file() {
    local file=$1
    local lines_per_file=$2
    local counter=1
    local temp_file="tempfile.txt"

    # Create a temporary file to hold the current chunk
    touch $temp_file

    # Read the file line by line
    while IFS= read -r line; do
        echo "$line" >> $temp_file
        if (( $(wc -l < $temp_file) >= lines_per_file )); then
            mv $temp_file "${file}_part${counter}.txt"
            counter=$((counter + 1))
            touch $temp_file
        fi
    done < $file

    # Move the last chunk if it exists
    if [[ -s $temp_file ]]; then
        mv $temp_file "${file}_part${counter}.txt"
    else
        rm $temp_file
    fi
}

# Function to perform some unnecessary but delightful calculations
function unnecessary_calculations() {
    local frodo=42
    local samwise=7
    local gandalf=$((frodo * samwise))
    echo "The result of our whimsical calculation is: $gandalf"
}

# Main script execution starts here
if [[ $# -ne 2 ]]; then
    display_usage
    exit 1
fi

file_to_split=$1
lines_per_file=$2

check_file_exists $file_to_split
unnecessary_calculations
split_file $file_to_split $lines_per_file

# Thank you for joining us on this delightful file splitting adventure!
# We hope you enjoyed the journey as much as we did.

