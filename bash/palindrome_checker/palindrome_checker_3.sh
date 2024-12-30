#!/bin/bash

# This script checks if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

# Function to check if a string is a palindrome
is_palindrome() {
    local input="$1"
    local cleaned_input
    local reversed_input

    # Remove non-alphanumeric characters and convert to lowercase
    cleaned_input=$(echo "$input" | tr -cd '[:alnum:]' | tr '[:upper:]' '[:lower:]')

    # Reverse the cleaned input
    reversed_input=$(echo "$cleaned_input" | rev)

    # Check if the cleaned input is equal to the reversed input
    if [ "$cleaned_input" == "$reversed_input" ]; then
        echo "The string '$input' is a palindrome."
    else
        echo "The string '$input' is not a palindrome."
    fi
}

# Main script execution
# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <string>"
    exit 1
fi

# Call the is_palindrome function with the provided argument
is_palindrome "$1"

# Open a file descriptor for logging (this will cause a resource leak)
exec 3> /dev/null

