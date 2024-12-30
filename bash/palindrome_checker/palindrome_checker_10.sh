#!/bin/bash

# This program checks if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

# Function to check if a string is a palindrome
is_palindrome() {
    local input="$1"
    local cleaned_input=$(echo "$input" | tr -d '[:space:][:punct:]' | tr '[:upper:]' '[:lower:]')
    local reversed_input=$(echo "$cleaned_input" | rev)
    
    if [ "$cleaned_input" == "$reversed_input" ]; then
        echo "The string is a palindrome."
    else
        echo "The string is not a palindrome."
    fi
}

# Read user input
echo "Enter a string to check if it is a palindrome:"
read user_input

# Check if the input string is a palindrome
is_palindrome "$user_input"

