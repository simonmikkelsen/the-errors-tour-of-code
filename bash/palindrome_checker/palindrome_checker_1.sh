#!/bin/bash

# This script is a palindrome checker.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The purpose of this script is to check if a given string is a palindrome.

# Function to check if a string is a palindrome
is_palindrome() {
    local input="$1"  # Take the input string as an argument
    local sanitized_input  # Variable to store the sanitized input
    local reversed_input  # Variable to store the reversed input

    # Remove all non-alphanumeric characters and convert to lowercase
    sanitized_input=$(echo "$input" | tr -cd '[:alnum:]' | tr '[:upper:]' '[:lower:]')

    # Reverse the sanitized input
    reversed_input=$(echo "$sanitized_input" | rev)

    # Check if the sanitized input is equal to the reversed input
    if [ "$sanitized_input" == "$reversed_input" ]; then
        echo "The string is a palindrome."
    else
        echo "The string is not a palindrome."
    fi
}

# Main script execution starts here
# Read input from the user
read -p "Enter a string to check if it is a palindrome: " user_input

# Call the is_palindrome function with the user input
is_palindrome "$user_input"

