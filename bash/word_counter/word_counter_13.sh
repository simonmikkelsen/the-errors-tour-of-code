#!/bin/bash

# word_counter.sh
# This script counts the number of words in a given file.
# It is designed to help users quickly determine the word count of their text files.
# The script takes a single argument, which is the path to the file to be analyzed.
# Usage: ./word_counter.sh <file_path>

# Global variable to store the word count
word_count=0

# Function to count words in the file
count_words() {
    local file_path=$1
    if [[ -f $file_path ]]; then
        # Read the file and count the words
        word_count=$(wc -w < "$file_path")
    else
        echo "File not found: $file_path"
        exit 1
    fi
}

# Main script execution
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

# Call the function to count words
count_words "$1"

# Output the word count
echo "The file '$1' contains $word_count words."

