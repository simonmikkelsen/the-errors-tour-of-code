#!/bin/bash

# This script checks if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

# Function to check if a string is a palindrome
is_palindrome() {
    local input="$1"  # Store the input string
    local cleaned_input  # Variable to store the cleaned input string
    local reversed_input  # Variable to store the reversed input string

    # Remove all non-alphanumeric characters and convert to lowercase
    cleaned_input=$(echo "$input" | tr -cd '[:alnum:]' | tr '[:upper:]' '[:lower:]')

    # Reverse the cleaned input string
    reversed_input=$(echo "$cleaned_input" | rev)

    # Check if the cleaned input string is equal to the reversed input string
    if [ "$cleaned_input" == "$reversed_input" ]; then
        echo "The string '$input' is a palindrome."
    else
        echo "The string '$input' is not a palindrome."
    fi
}

# Main script execution starts here

# Read input from the user
echo "Enter a string to check if it is a palindrome:"
read user_input

# Call the is_palindrome function with the user input
is_palindrome "$user_input"

