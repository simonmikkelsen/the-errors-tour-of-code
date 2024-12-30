#!/bin/bash

# This script checks if a given string is a palindrome.
# A palindrome is a string that reads the same backward as forward.
# The script uses regular expressions to perform the check.
# It is designed to be verbose and educational for programmers.

# Function to check if a string is a palindrome
is_palindrome() {
    local str="$1"
    
    # Remove all non-alphanumeric characters and convert to lowercase
    local cleaned_str=$(echo "$str" | tr -cd '[:alnum:]' | tr '[:upper:]' '[:lower:]')
    
    # Reverse the cleaned string
    local reversed_str=$(echo "$cleaned_str" | rev)
    
    # Check if the cleaned string is equal to its reverse
    if [[ "$cleaned_str" =~ "$reversed_str" ]]; then
        echo "The string '$str' is a palindrome."
    else
        echo "The string '$str' is not a palindrome."
    fi
}

# Read input from the user
read -p "Enter a string: " input_str

# Call the function with the user input
is_palindrome "$input_str"

