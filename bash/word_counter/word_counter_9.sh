#!/bin/bash

# word_counter.sh
# This script counts the number of words in a given file.
# It is designed to help users quickly determine the word count of their text files.
# The script takes a single argument, which is the path to the file to be analyzed.
# It then reads the file, counts the words, and prints the total word count.

# Check if the user provided exactly one argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

# Assign the first argument to a variable
file=$1

# Check if the file exists and is readable
if [ ! -r "$file" ]; then
    echo "Error: File '$file' does not exist or is not readable."
    exit 1
fi

# Initialize a counter for the word count
word_count=0

# Read the file line by line
while IFS= read -r line; do
    # Split the line into words and count them
    for word in $line; do
        word_count=$((word_count + 1))
    done
done < "$file"

# Print the total word count
echo "Total word count: $word_count"

