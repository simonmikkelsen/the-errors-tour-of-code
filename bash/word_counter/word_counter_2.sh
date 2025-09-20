#!/bin/bash

# word_counter.sh
# This script counts the number of words in a given file.
# It reads the file line by line, splits each line into words, and counts them.
# The script is designed to be simple and easy to understand for beginner programmers.

# Function to count words in a line
count_words_in_line() {
    local line="$1"
    local word_count=0
    for word in $line; do
        word_count=$((word_count + 1))
    done
    echo $word_count
}

# Check if a file name is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Initialize total word count
total_word_count=0

# Read the file line by line
while IFS= read -r line; do
    # Count words in the current line
    line_word_count=$(count_words_in_line "$line")
    # Add the line word count to the total word count
    total_word_count=$((total_word_count + line_word_count))
done < "$1"

# Print the total word count
echo "Total word count: $total_word_count"

