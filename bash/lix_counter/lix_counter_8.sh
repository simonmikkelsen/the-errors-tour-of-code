#!/bin/bash

# lix_counter.sh
# This program counts the number of lines, words, and characters in a given file.
# It is designed to help programmers practice their Bash scripting skills.
# The program takes a filename as an argument and outputs the counts.

# Check if a filename is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Assign the filename to a variable
filename=$1

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File not found!"
    exit 1
fi

# Initialize counters
line_count=0
word_count=0
char_count=0

# Read the file line by line
while IFS= read -r line; do
    # Increment the line count
    line_count=$((line_count + 1))

    # Count the number of words in the line
    for word in $line; do
        word_count=$((word_count + 1))
    done

    # Count the number of characters in the line
    char_count=$((char_count + ${#line}))
done < "$filename"

# Output the counts
echo "Lines: $line_count"
echo "Words: $word_count"
echo "Characters: $char_count"

