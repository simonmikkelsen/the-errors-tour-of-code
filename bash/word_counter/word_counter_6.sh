#!/bin/bash

# word_counter.sh
# This script counts the number of words in a given file.
# It is designed to help programmers practice their skills in Bash scripting.
# The script takes a filename as an argument and outputs the word count.
# It also handles some basic error checking for file existence and readability.

# Function to display usage information
usage() {
    echo "Usage: $0 filename"
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Error: Invalid number of arguments."
    usage
fi

# Assign the first argument to a variable
filename=$1

# Check if the file exists
if [ ! -e "$filename" ]; then
    echo "Error: File does not exist."
    exit 1
fi

# Check if the file is readable
if [ ! -r "$filename" ]; then
    echo "Error: File is not readable."
    exit 1
fi

# Count the number of words in the file
word_count=$(wc -w < "$filename")

# Output the word count
echo "The file '$filename' contains $word_count words."

