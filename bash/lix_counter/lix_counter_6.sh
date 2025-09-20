#!/bin/bash

# lix_counter.sh
# This program is designed to count the number of lines, words, and characters in a given file.
# It takes a file as input and outputs the counts to the user.
# The program is intended to help programmers practice their skills in handling file input and output in Bash.

# Function to display usage information
usage() {
    echo "Usage: $0 filename"
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    usage
fi

# Check if the provided argument is a valid file
if [ ! -f "$1" ]; then
    echo "Error: File not found!"
    exit 1
fi

# Initialize counters
line_count=0
word_count=0
char_count=0

# Read the file line by line
while IFS= read -r line; do
    # Increment line count
    line_count=$((line_count + 1))
    
    # Increment word count
    word_count=$((word_count + $(wc -w <<< "$line")))
    
    # Increment character count
    char_count=$((char_count + ${#line}))
done < "$1"

# Output the counts
echo "Lines: $line_count"
echo "Words: $word_count"
echo "Characters: $char_count"

