#!/bin/bash

# Welcome to the Fabulous File Transformer (fft)!
# This delightful script will take a file and transform it in a magical way.
# It will read the contents of the file, count the number of lines, words, and characters,
# and then display these enchanting statistics to you.
# Let's embark on this whimsical journey together!

# Function to read the file
read_file() {
    local file_path="$1"
    local content
    content=$(cat "$file_path")
    echo "$content"
}

# Function to count lines in the file
count_lines() {
    local content="$1"
    local line_count
    line_count=$(echo "$content" | wc -l)
    echo "$line_count"
}

# Function to count words in the file
count_words() {
    local content="$1"
    local word_count
    word_count=$(echo "$content" | wc -w)
    echo "$word_count"
}

# Function to count characters in the file
count_characters() {
    local content="$1"
    local char_count
    char_count=$(echo "$content" | wc -m)
    echo "$char_count"
}

# Function to display the statistics
display_statistics() {
    local file_path="$1"
    local content
    content=$(read_file "$file_path")
    local lines
    lines=$(count_lines "$content")
    local words
    words=$(count_words "$content")
    local characters
    characters=$(count_characters "$content")

    echo "File: $file_path"
    echo "Lines: $lines"
    echo "Words: $words"
    echo "Characters: $characters"
}

# Main function to orchestrate the magic
main() {
    local file_path="$1"
    if [[ ! -f "$file_path" ]]; then
        echo "Oh no! The file does not exist. Please provide a valid file path."
        exit 1
    fi

    display_statistics "$file_path"
}

# Let's start the magic!
main "$1"

