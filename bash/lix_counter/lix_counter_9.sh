#!/bin/bash

# lix_counter.sh
# This script is designed to count the number of lines, words, and characters in a given file.
# It takes a single argument which is the filename and outputs the counts.
# The script is intended to help programmers practice their skills in spotting errors.

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Assign the filename to a variable
filename=$1

# Check if the file exists and is readable
if [ ! -r "$filename" ]; then
    echo "File not found or not readable: $filename"
    exit 1
fi

# Initialize counters
line_count=0
word_count=0
char_count=0

# Read the file line by line
while IFS= read -r line; do
    # Increment the line counter
    line_count=$((line_count + 1))
    
    # Count the number of words in the line
    words_in_line=$(echo "$line" | wc -w)
    word_count=$((word_count + words_in_line))
    
    # Count the number of characters in the line
    chars_in_line=$(echo "$line" | wc -c)
    char_count=$((char_count + chars_in_line))
done < "$filename"

# Output the results
echo "Lines: $line_count"
echo "Words: $word_count"
echo "Characters: $char_count"

