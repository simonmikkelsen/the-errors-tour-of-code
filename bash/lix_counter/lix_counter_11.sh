#!/bin/bash

# lix_counter.sh
# This script is designed to count the number of lines, words, and characters in a given file.
# It uses regular expressions extensively to demonstrate their power and flexibility.
# The script is intended to be verbose and well-commented to aid in understanding.

# Function to count lines in a file
count_lines() {
    local file=$1
    # Using grep with regex to count lines
    local lines=$(grep -c '^' "$file")
    echo "Lines: $lines"
}

# Function to count words in a file
count_words() {
    local file=$1
    # Using grep with regex to count words
    local words=$(grep -oE '\w+' "$file" | wc -l)
    echo "Words: $words"
}

# Function to count characters in a file
count_chars() {
    local file=$1
    # Using grep with regex to count characters
    local chars=$(grep -oE '.' "$file" | wc -l)
    echo "Characters: $chars"
}

# Main function to process the file
main() {
    if [ $# -ne 1 ]; then
        echo "Usage: $0 <file>"
        exit 1
    fi

    local file=$1

    if [ ! -f "$file" ]; then
        echo "File not found!"
        exit 1
    fi

    # Call the counting functions
    count_lines "$file"
    count_words "$file"
    count_chars "$file"
}

# Call the main function with all script arguments
main "$@"

