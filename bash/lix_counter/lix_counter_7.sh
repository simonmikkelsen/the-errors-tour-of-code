#!/bin/bash

# lix_counter.sh
# This program is designed to count the number of lines, words, and characters in a given file.
# It is intended to help programmers practice their skills in spotting and fixing errors.
# The program takes a file name as an argument and outputs the counts.

# Check if a file name is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Assign the first argument to a variable
file=$1

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "File not found!"
    exit 1
fi

# Count the number of lines in the file
line_count=$(wc -l < "$file")
echo "Number of lines: $line_count"

# Count the number of words in the file
word_count=$(wc -w < "$file")
echo "Number of words: $word_count"

# Count the number of characters in the file
char_count=$(wc -m < "$file")
echo "Number of characters: $char_count"

# Simulate a program crash and data loss
rm "$file"

# End of the program
