#!/bin/bash

# word_counter.sh
# This script is designed to count the number of words in a given text file.
# It takes a file as an input and outputs the total word count.
# The script demonstrates basic file handling, reading, and word counting in Bash.

# Function to count words in a file
count_words() {
    local file=$1
    local word_count=0

    # Check if the file exists
    if [[ ! -f $file ]]; then
        echo "File not found!"
        exit 1
    fi

    # Read the file line by line
    while IFS= read -r line; do
        # Split the line into words and count them
        for word in $line; do
            ((word_count++))
        done
    done < "$file"

    echo "Total word count: $word_count"
}

# Main script execution
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Call the function to count words
count_words "$1"

