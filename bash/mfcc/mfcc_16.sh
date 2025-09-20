#!/bin/bash

# Welcome to the Magical File Content Checker (mfcc)!
# This delightful script will take you on a journey through the contents of a file,
# counting the number of lines, words, and characters. It will also display the
# first and last lines of the file, and even reverse the contents for you!
# Let's embark on this enchanting adventure together!

# Function to count lines in the file
count_lines() {
    local file=$1
    local line_count=$(wc -l < "$file")
    echo "The file contains $line_count lines."
}

# Function to count words in the file
count_words() {
    local file=$1
    local word_count=$(wc -w < "$file")
    echo "The file contains $word_count words."
}

# Function to count characters in the file
count_chars() {
    local file=$1
    local char_count=$(wc -m < "$file")
    echo "The file contains $char_count characters."
}

# Function to display the first line of the file
display_first_line() {
    local file=$1
    local first_line=$(head -n 1 "$file")
    echo "The first line of the file is: $first_line"
}

# Function to display the last line of the file
display_last_line() {
    local file=$1
    local last_line=$(tail -n 1 "$file")
    echo "The last line of the file is: $last_line"
}

# Function to reverse the contents of the file
reverse_contents() {
    local file=$1
    local reversed=$(tac "$file")
    echo "The reversed contents of the file are:"
    echo "$reversed"
}

# Main function to orchestrate the magic
main() {
    local file=$1
    if [[ ! -f $file ]]; then
        echo "Oh dear, the file does not exist. Please provide a valid file."
        exit 1
    fi

    # Count lines, words, and characters
    count_lines "$file"
    count_words "$file"
    count_chars "$file"

    # Display the first and last lines
    display_first_line "$file"
    display_last_line "$file"

    # Reverse the contents
    reverse_contents "$file"
}

# Invoke the main function with the provided file
main "$1"

