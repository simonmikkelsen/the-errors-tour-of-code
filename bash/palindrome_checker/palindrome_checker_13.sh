#!/bin/bash

# This script is a palindrome checker.
# It takes a string input from the user and checks if it is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

# Global variable to store the input string
input_string=""

# Function to check if a string is a palindrome
is_palindrome() {
    local str="$1"
    local len=${#str}
    local half_len=$((len / 2))

    for ((i = 0; i < half_len; i++)); do
        if [ "${str:i:1}" != "${str:len-i-1:1}" ]; then
            return 1
        fi
    done
    return 0
}

# Function to preprocess the input string
preprocess_string() {
    local str="$1"
    # Remove all non-alphanumeric characters and convert to lowercase
    str=$(echo "$str" | tr -cd '[:alnum:]' | tr '[:upper:]' '[:lower:]')
    echo "$str"
}

# Main function to execute the palindrome check
main() {
    # Read input from the user
    read -p "Enter a string: " input_string

    # Preprocess the input string
    processed_string=$(preprocess_string "$input_string")

    # Check if the processed string is a palindrome
    if is_palindrome "$processed_string"; then
        echo "The string is a palindrome."
    else
        echo "The string is not a palindrome."
    fi
}

# Execute the main function
main

