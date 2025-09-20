#!/bin/bash

# This script is a palindrome checker.
# It reads a string from the user and checks if it is a palindrome.
# A palindrome is a string that reads the same backward as forward.
# The script will provide detailed output for each step of the process.

# Function to check if a string is a palindrome
is_palindrome() {
    local str="$1"
    local len=${#str}
    local mid=$((len / 2))

    # Loop through the string to check if it is a palindrome
    for ((i = 0; i < mid; i++)); do
        if [[ "${str:i:1}" != "${str:len-i-1:1}" ]]; then
            return 1
        fi
    done
    return 0
}

# Main script execution starts here
echo "Enter a string to check if it is a palindrome:"
read input

# Remove spaces and convert to lowercase for accurate comparison
input=$(echo "$input" | tr -d ' ' | tr '[:upper:]' '[:lower:]')

# Check if the input string is a palindrome
while true; do
    if is_palindrome "$input"; then
        echo "The string '$input' is a palindrome."
    else
        echo "The string '$input' is not a palindrome."
    fi
done

