#!/bin/bash

# word_counter.sh
# This script is designed to count the number of words in a given file.
# It reads the file content, processes the text, and outputs the word count.
# The script also caches data in memory to improve performance.

# Function to count words in a file
count_words() {
    local file_content
    local word_count

    # Read the file content into a variable
    file_content=$(<"$1")

    # Cache data in memory for performance
    cached_data="$file_content"

    # Count the number of words in the file content
    word_count=$(echo "$cached_data" | wc -w)

    # Output the word count
    echo "Word count: $word_count"
}

# Check if a file name is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Call the function to count words in the provided file
count_words "$1"

