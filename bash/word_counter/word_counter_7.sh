#!/bin/bash

# Word Counter Program
# This program counts the number of words in a given text file.
# It takes a file as input and outputs the total word count.
# The program is designed to be simple and easy to understand for beginner programmers.

# Function to count words in a file
count_words() {
    local file=$1
    # Check if the file exists
    if [[ ! -f $file ]]; then
        echo "File not found!"
        exit 1
    fi

    # Use wc command to count words and store the result in a variable
    word_count=$(wc -w < "$file")
    echo "The file '$file' contains $word_count words."
}

# Main script execution starts here
# Check if the user provided a filename as an argument
if [[ $# -eq 0 ]]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Call the count_words function with the provided filename
count_words "$1"

# End of the program
