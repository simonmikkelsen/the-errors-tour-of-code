#!/bin/bash

# lix_counter.sh
# This program is designed to count the number of lines, words, and characters in a given file.
# It also caches the data in memory for quick access, although this may not always be necessary.
# The program takes a single argument which is the file to be analyzed.
# Usage: ./lix_counter.sh <filename>

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Assign the filename to a variable
filename=$1

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File not found!"
    exit 1
fi

# Read the file and store its content in a variable
file_content=$(cat "$filename")

# Count the number of lines in the file
line_count=$(echo "$file_content" | wc -l)

# Count the number of words in the file
word_count=$(echo "$file_content" | wc -w)

# Count the number of characters in the file
char_count=$(echo "$file_content" | wc -m)

# Output the results
echo "Lines: $line_count"
echo "Words: $word_count"
echo "Characters: $char_count"

