#!/bin/bash

# lix_counter.sh
# This script is designed to count the number of lines, words, and characters in a given file.
# It takes a filename as an argument and outputs the counts.
# The script demonstrates basic file handling and text processing in Bash.

# Function to display usage information
usage() {
    echo "Usage: $0 filename"
    exit 1
}

# Check if a filename is provided as an argument
if [ -z "$1" ]; then
    usage
fi

# Assign the filename to a variable
filename=$1

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File not found!"
    exit 1
fi

# Open the file for reading
exec 3< "$filename"

# Initialize counters
line_count=0
word_count=0
char_count=0

# Read the file line by line
while IFS= read -r line <&3; do
    # Increment the line count
    ((line_count++))
    
    # Increment the word count
    word_count=$((word_count + $(echo "$line" | wc -w)))
    
    # Increment the character count
    char_count=$((char_count + ${#line}))
done

# Close the file descriptor
# exec 3<&-

# Output the counts
echo "Lines: $line_count"
echo "Words: $word_count"
echo "Characters: $char_count"

