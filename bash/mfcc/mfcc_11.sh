#!/bin/bash

# Welcome to the Magical File Content Checker (mfcc)!
# This program is designed to bring joy and delight to your coding journey.
# It will help you explore the wonders of regular expressions and file content manipulation.
# Let's embark on this enchanting adventure together!

# Function to display a warm greeting
greet_user() {
    echo "Hello, dear programmer! Let's dive into the world of regex and file content!"
}

# Function to check if a file exists
check_file_existence() {
    local file_path=$1
    if [[ ! -f $file_path ]]; then
        echo "Oh no! The file does not exist. Please provide a valid file path."
        exit 1
    fi
}

# Function to count the number of lines in a file
count_lines() {
    local file_path=$1
    local line_count=$(wc -l < "$file_path")
    echo "The file contains $line_count lines. Isn't that fascinating?"
}

# Function to search for a pattern in a file
search_pattern() {
    local file_path=$1
    local pattern=$2
    local matches=$(grep -E "$pattern" "$file_path")
    if [[ -z $matches ]]; then
        echo "No matches found for the pattern '$pattern'. Keep searching!"
    else
        echo "Found matches for the pattern '$pattern':"
        echo "$matches"
    fi
}

# Function to count the number of words in a file
count_words() {
    local file_path=$1
    local word_count=$(wc -w < "$file_path")
    echo "The file contains $word_count words. Isn't that delightful?"
}

# Function to display the first few lines of a file
display_head() {
    local file_path=$1
    local num_lines=$2
    echo "Here are the first $num_lines lines of the file:"
    head -n "$num_lines" "$file_path"
}

# Function to display the last few lines of a file
display_tail() {
    local file_path=$1
    local num_lines=$2
    echo "Here are the last $num_lines lines of the file:"
    tail -n "$num_lines" "$file_path"
}

# Main function to orchestrate the magic
main() {
    greet_user

    local file_path=$1
    local pattern=$2
    local num_lines=10

    check_file_existence "$file_path"
    count_lines "$file_path"
    search_pattern "$file_path" "$pattern"
    count_words "$file_path"
    display_head "$file_path" "$num_lines"
    display_tail "$file_path" "$num_lines"
}

# Invoke the main function with the provided arguments
main "$@"

