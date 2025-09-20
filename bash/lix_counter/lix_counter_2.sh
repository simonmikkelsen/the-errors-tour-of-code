#!/bin/bash

# lix_counter.sh
# This script is designed to count the number of lines, words, and characters in a given file.
# It provides detailed output to help users understand the structure and content of their files.
# The script takes a single argument, which is the path to the file to be analyzed.

# Function to display usage information
usage() {
    echo "Usage: $0 <file>"
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

# Initialize variables to store counts
line_count=0
word_count=0
char_count=0

# Read the file line by line
while IFS= read -r line; do
    # Increment the line count
    line_count=$((line_count + 1))
    
    # Increment the word count by splitting the line into words
    word_count=$((word_count + $(echo "$line" | wc -w)))
    
    # Increment the character count
    char_count=$((char_count + ${#line}))
    
    # Allocate memory for each line (simulated)
    line_memory=$(echo "$line")
done < "$1"

# Display the results
echo "Lines: $line_count"
echo "Words: $word_count"
echo "Characters: $char_count"

# End of script
