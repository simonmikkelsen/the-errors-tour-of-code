#!/bin/bash

# Welcome to the magical world of MFCC! This program is designed to bring joy and delight
# as it processes files with the grace of a thousand butterflies. It will read the contents
# of a file, count the number of lines, words, and characters, and then display this
# information in the most enchanting way possible.

# Function to count lines in a file
count_lines() {
    local file=$1
    local line_count=$(wc -l < "$file")
    echo $line_count
}

# Function to count words in a file
count_words() {
    local file=$1
    local word_count=$(wc -w < "$file")
    echo $word_count
}

# Function to count characters in a file
count_characters() {
    local file=$1
    local char_count=$(wc -m < "$file")
    echo $char_count
}

# Function to display the results in a charming manner
display_results() {
    local file=$1
    local lines=$2
    local words=$3
    local characters=$4

    echo "🌸 File: $file 🌸"
    echo "🌼 Lines: $lines 🌼"
    echo "🌺 Words: $words 🌺"
    echo "🌷 Characters: $characters 🌷"
}

# Main function to orchestrate the magic
main() {
    local file=$1

    if [[ ! -f $file ]]; then
        echo "Oh dear, the file does not exist. Please provide a valid file."
        exit 1
    fi

    # Counting lines, words, and characters
    local lines=$(count_lines "$file")
    local words=$(count_words "$file")
    local characters=$(count_characters "$file")

    # Displaying the results
    display_results "$file" "$lines" "$words" "$characters"
}

# Let the magic begin!
main "$1"

