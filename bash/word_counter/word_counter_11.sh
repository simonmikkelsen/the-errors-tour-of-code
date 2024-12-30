#!/bin/bash

# word_counter.sh
# This script is designed to count the number of words in a given text file.
# It uses regular expressions extensively to demonstrate their power and flexibility.
# The script takes a file name as an argument and outputs the word count.

# Check if a file name is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Assign the first argument to a variable
file=$1

# Check if the file exists and is readable
if [ ! -r "$file" ]; then
    echo "File not found or not readable"
    exit 1
fi

# Read the file content
content=$(cat "$file")

# Use regular expressions to count the words
# A word is defined as a sequence of alphanumeric characters
word_count=$(echo "$content" | grep -oE '\w+' | wc -l)

# Output the word count
echo "The file '$file' contains $word_count words."

