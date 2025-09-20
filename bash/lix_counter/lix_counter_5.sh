#!/bin/bash

# lix_counter.sh
# This program is designed to count the number of lines, words, and characters in a given file.
# It is intended to help programmers practice their skills in spotting and fixing errors.
# The program takes a single argument, which is the path to the file to be analyzed.
# It then outputs the counts of lines, words, and characters in the file.

# Function to count lines in the file
count_lines() {
    local file=$1
    local lines=$(wc -l < "$file")
    echo "Number of lines: $lines"
}

# Function to count words in the file
count_words() {
    local file=$1
    local words=$(wc -w < "$file")
    echo "Number of words: $words"
}

# Function to count characters in the file
count_characters() {
    local file=$1
    local characters=$(wc -m < "$file")
    echo "Number of characters: $characters"
}

# Main script execution starts here
if [ $# -ne 1 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

file=$1

if [ ! -f "$file" ]; then
    echo "Error: File not found!"
    exit 1
fi

# Call the functions to count lines, words, and characters
count_lines "$file"
count_words "$file"
count_characters "$file"

# End of script
