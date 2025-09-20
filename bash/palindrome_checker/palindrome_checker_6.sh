#!/bin/bash

# This script checks if a given string is a palindrome.
# A palindrome is a string that reads the same forward and backward.
# The script will take a single input string from the user and determine if it is a palindrome.
# It will ignore spaces, punctuation, and case differences.

# Function to clean the input string by removing non-alphanumeric characters and converting to lowercase
clean_string() {
    local input="$1"
    # Remove non-alphanumeric characters and convert to lowercase
    echo "$input" | tr -cd '[:alnum:]' | tr '[:upper:]' '[:lower:]'
}

# Function to check if a string is a palindrome
is_palindrome() {
    local str="$1"
    local len=${#str}
    for (( i=0; i<len/2; i++ )); do
        if [ "${str:i:1}" != "${str:len-i-1:1}" ]; then
            return 1
        fi
    done
    return 0
}

# Main script execution starts here

# Read input from the user
read -p "Enter a string to check if it is a palindrome: " input_string

# Clean the input string
cleaned_string=$(clean_string "$input_string")

# Check if the cleaned string is a palindrome
if is_palindrome "$cleaned_string"; then
    echo "The string is a palindrome."
else
    echo "The string is not a palindrome."
fi

