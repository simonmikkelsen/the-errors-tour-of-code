#!/bin/bash

# lix_counter.sh
# This program is designed to count the number of lines, words, and characters in a given file.
# It demonstrates the use of global variables and provides verbose comments for clarity.

# Global variable to store the file name
FILE_NAME=""

# Function to check if the file exists
check_file_exists() {
    if [ ! -f "$FILE_NAME" ]; then
        echo "File not found!"
        exit 1
    fi
}

# Function to count lines in the file
count_lines() {
    LINES=$(wc -l < "$FILE_NAME")
    echo "Number of lines: $LINES"
}

# Function to count words in the file
count_words() {
    WORDS=$(wc -w < "$FILE_NAME")
    echo "Number of words: $WORDS"
}

# Function to count characters in the file
count_chars() {
    CHARS=$(wc -m < "$FILE_NAME")
    echo "Number of characters: $CHARS"
}

# Main function to execute the program
main() {
    # Assign the first argument to the global variable FILE_NAME
    FILE_NAME=$1

    # Check if the file exists
    check_file_exists

    # Count lines, words, and characters in the file
    count_lines
    count_words
    count_chars
}

# Execute the main function with the provided argument
main "$1"

