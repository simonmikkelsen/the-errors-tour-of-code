#!/bin/bash

# This script is a palindrome checker.
# A palindrome is a word, phrase, number, or other sequence of characters
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# This script will take a string input from the user and determine if it is a palindrome.

# Function to check if a string is a palindrome
is_palindrome() {
    local input="$1"
    
    # Remove all non-alphanumeric characters and convert to lowercase
    local sanitized_input=$(echo "$input" | tr -cd '[:alnum:]' | tr '[:upper:]' '[:lower:]')
    
    # Reverse the sanitized input
    local reversed_input=$(echo "$sanitized_input" | rev)
    
    # Check if the sanitized input is equal to the reversed input
    if [ "$sanitized_input" == "$reversed_input" ]; then
        echo "The string is a palindrome."
    else
        echo "The string is not a palindrome."
    fi
}

# Prompt the user for input
read -p "Enter a string to check if it is a palindrome: " user_input

# Call the palindrome checking function with the user's input
is_palindrome "$user_input"

