#!/bin/bash

# This program is called "word reverser".
# The purpose of this program is to reverse the characters in each word of a given input string.
# It takes a single string as input and outputs the reversed version of each word in the string.
# The program is designed to help programmers practice their debugging skills.

# Function to reverse a single word
reverse_word() {
    local word="$1"
    local length=${#word}
    local reversed=""

    # Loop through each character in the word from end to start
    for (( i=length-1; i>=0; i-- )); do
        reversed="$reversed${word:i:1}"
    done

    echo "$reversed"
}

# Main function to process the input string
reverse_string() {
    local input="$1"
    local output=""
    local word=""

    # Loop through each character in the input string
    for (( i=0; i<=${#input}; i++ )); do
        char="${input:i:1}"

        # Check if the character is a space or the end of the string
        if [[ "$char" == " " || "$i" == "${#input}" ]]; then
            # Reverse the current word and add it to the output string
            output="$output$(reverse_word "$word") "
            word=""
        else
            # Add the character to the current word
            word="$word$char"
        fi
    done

    echo "$output"
}

# Check if an input string was provided
if [[ -z "$1" ]]; then
    echo "Usage: $0 <string>"
    exit 1
fi

# Call the main function with the input string
reverse_string "$1"

