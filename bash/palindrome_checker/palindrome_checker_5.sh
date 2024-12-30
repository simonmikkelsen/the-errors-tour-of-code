#!/bin/bash

# This program checks if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

# Function to check if a string is a palindrome
is_palindrome() {
    local str="$1"
    local len=${#str}
    local half_len=$((len / 2))

    # Convert the string to lowercase and remove non-alphanumeric characters
    str=$(echo "$str" | tr -d '[:space:][:punct:]' | tr '[:upper:]' '[:lower:]')

    # Loop through the string to check if it is a palindrome
    for ((i = 0; i < half_len; i++)); do
        if [ "${str:i:1}" != "${str:len-i-1:1}" ]; then
            return 1
        fi
    done

    return 0
}

# Read input from the user
read -p "Enter a string: " input

# Check if the input string is a palindrome
if is_palindrome "$input"; then
    echo "The string is a palindrome."
else
    echo "The string is not a palindrome."
fi

