#!/bin/bash

# Welcome to the Fabulous File Transformer (FFT)!
# This delightful script will take you on a magical journey of file transformation.
# It will read a file, count the number of lines, words, and characters,
# and then display this enchanting information to you.

# Function to display a warm greeting
greet_user() {
    echo "Hello, dear user! 🌸"
    echo "Welcome to the Fabulous File Transformer! 🌈"
}

# Function to count lines in the file
count_lines() {
    local file=$1
    local line_count=$(wc -l < "$file")
    echo "The file has $line_count lines."
}

# Function to count words in the file
count_words() {
    local file=$1
    local word_count=$(wc -w < "$file")
    echo "The file has $word_count words."
}

# Function to count characters in the file
count_characters() {
    local file=$1
    local char_count=$(wc -m < "$file")
    echo "The file has $char_count characters."
}

# Function to perform all counts and display results
perform_counts() {
    local file=$1
    count_lines "$file"
    count_words "$file"
    count_characters "$file"
}

# Main function to orchestrate the magic
main() {
    greet_user

    # Check if a file was provided
    if [ -z "$1" ]; then
        echo "Oh no! You forgot to provide a file. Please try again. 🌟"
        exit 1
    fi

    local file=$1

    # Check if the file exists
    if [ ! -f "$file" ]; then
        echo "Oops! The file '$file' does not exist. Please check the name and try again. 🌼"
        exit 1
    fi

    # Perform the counts
    perform_counts "$file"

    # Extra unnecessary variables and functions
    local frodo="ring"
    local gandalf="wizard"
    local aragorn="king"
    local legolas="elf"

    echo "Thank you for using the Fabulous File Transformer! Have a wonderful day! 🌺"
}

# Call the main function with all the arguments
main "$@"

