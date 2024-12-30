#!/bin/bash

# word_counter.sh
# This script is designed to count the number of words in a given text file.
# It takes a file as an input argument and outputs the total word count.
# The script is intended to help users quickly determine the size of text files in terms of word count.

# Check if the user has provided an input file
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

# Use the wc (word count) command to count the number of words in the file
# The -w option tells wc to count words
word_count=$(wc -w < "$input_file")

# Output the word count to the user
echo "The file '$input_file' contains $word_count words."

