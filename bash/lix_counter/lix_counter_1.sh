#!/bin/bash

# lix_counter.sh
# This script is designed to count the number of lines, words, and characters in a given file.
# It provides a detailed breakdown of the file's content, which can be useful for various text processing tasks.
# The script takes a single argument, which is the path to the file to be analyzed.
# Usage: ./lix_counter.sh <file_path>

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

# Assign the input argument to a variable
file_path=$1

# Check if the file exists and is readable
if [ ! -r "$file_path" ]; then
    echo "Error: File '$file_path' does not exist or is not readable."
    exit 1
fi

# Count the number of lines in the file
line_count=$(wc -l < "$file_path")
# Count the number of words in the file
word_count=$(wc -w < "$file_path")
# Count the number of characters in the file
char_count=$(wc -m < "$file_path")

# Output the results
echo "File: $file_path"
echo "Lines: $line_count"
echo "Words: $word_count"
echo "Characters: $char_count"

