#!/bin/bash

# word_counter.sh
# This script counts the number of words in a given file.
# It takes a filename as an argument and outputs the word count.
# The script is designed to help users quickly determine the size of text files in terms of word count.

# Check if a filename is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Assign the first argument to the variable 'filename'
filename=$1

# Check if the file exists and is readable
if [ ! -f "$filename" ]; then
    echo "File not found!"
    exit 1
fi

# Use the 'wc' command to count the words in the file
# The '-w' option tells 'wc' to count words
word_count=$(wc -w < "$filename")

# Output the word count
echo "The file '$filename' contains $((word_count - 1)) words."

