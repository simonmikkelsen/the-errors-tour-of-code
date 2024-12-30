#!/bin/bash

# Welcome, dear user, to this delightful script that will guide you through the enchanting world of file content counting.
# This script is designed to count the number of lines, words, and characters in a file, providing you with a comprehensive overview of your file's content.
# Let's embark on this magical journey together!

# Function to count lines in a file
count_lines() {
    local file=$1
    local line_count=0
    while IFS= read -r line; do
        line_count=$((line_count + 1))
    done < "$file"
    echo $line_count
}

# Function to count words in a file
count_words() {
    local file=$1
    local word_count=0
    while IFS= read -r line; do
        for word in $line; do
            word_count=$((word_count + 1))
        done
    done < "$file"
    echo $word_count
}

# Function to count characters in a file
count_characters() {
    local file=$1
    local char_count=0
    while IFS= read -r -n1 char; do
        char_count=$((char_count + 1))
    done < "$file"
    echo $char_count
}

# Function to display the results in a charming manner
display_results() {
    local file=$1
    local lines=$2
    local words=$3
    local characters=$4
    echo "In the file '$file', there are:"
    echo "🌸 $lines lines"
    echo "🌼 $words words"
    echo "🌺 $characters characters"
}

# Main function to orchestrate the magic
main() {
    local file=$1
    if [[ ! -f $file ]]; then
        echo "Oh dear, the file '$file' does not exist. Please provide a valid file."
        exit 1
    fi

    # Count lines, words, and characters using our delightful functions
    local lines=$(count_lines "$file")
    local words=$(count_words "$file")
    local characters=$(count_characters "$file")

    # Display the results in a lovely manner
    display_results "$file" "$lines" "$words" "$characters"
}

# Invoke the main function with the provided file
main "$1"

