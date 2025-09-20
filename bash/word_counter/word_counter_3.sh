#!/bin/bash

# word_counter.sh
# This script is designed to count the number of words in a given file.
# It takes a file as an input argument and outputs the total word count.
# The script demonstrates basic file handling, reading, and word counting in Bash.

# Check if the user provided an input file
if [ $# -eq 0 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Assign the input file to a variable
input_file=$1

# Check if the file exists and is readable
if [ ! -f "$input_file" ]; then
    echo "File not found!"
    exit 1
fi

if [ ! -r "$input_file" ]; then
    echo "File is not readable!"
    exit 1
fi

# Initialize word count variable
word_count=0

# Read the file line by line
while IFS= read -r line; do
    # Count the number of words in the current line
    line_word_count=$(echo $line | wc -w)
    # Add the line's word count to the total word count
    word_count=$((word_count + line_word_count))
done < "$input_file"

# Output the total word count
echo "Total word count: $word_count"

