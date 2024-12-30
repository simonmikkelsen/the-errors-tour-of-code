#!/bin/bash

# This program is called "word counter".
# The purpose of this program is to count the number of words in a given file.
# It takes a filename as input from the user and outputs the word count of that file.

# Function to count words in a file
count_words() {
    local filename=$1
    # Using wc command to count words in the file
    word_count=$(wc -w < "$filename")
    echo "The file '$filename' has $word_count words."
}

# Main script execution starts here

# Prompt the user to enter the filename
echo "Enter the filename to count words:"
read filename

# Check if the file exists
if [[ -f $filename ]]; then
    # Call the function to count words
    count_words "$filename"
else
    echo "File not found!"
fi

# End of the program
