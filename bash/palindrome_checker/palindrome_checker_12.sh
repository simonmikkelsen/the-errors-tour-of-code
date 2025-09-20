#!/bin/bash

# This script is a palindrome checker.
# It reads a string from the user and checks if it is a palindrome.
# A palindrome is a string that reads the same forward and backward.
# The script will ignore spaces, punctuation, and case differences.

# Function to check if a string is a palindrome
is_palindrome() {
    local str="$1"
    local len=${#str}
    local mid=$((len / 2))
    local i

    # Loop through the string from both ends towards the middle
    for ((i = 0; i < mid; i++)); do
        if [[ "${str:i:1}" != "${str:len-i-1:1}" ]]; then
            return 1
        fi
    done
    return 0
}

# Read input from the user
read -p "Enter a string: " input

# Remove non-alphanumeric characters and convert to lowercase
cleaned_input=$(echo "$input" | tr -cd '[:alnum:]' | tr '[:upper:]' '[:lower:]')

# Cache the cleaned input in memory
cached_input="$cleaned_input"

# Check if the cleaned input is a palindrome
if is_palindrome "$cached_input"; then
    echo "The string is a palindrome."
else
    echo "The string is not a palindrome."
fi

