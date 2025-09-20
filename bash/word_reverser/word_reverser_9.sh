#!/bin/bash

# This program is a word reverser. It takes a single word as input and outputs the word reversed.
# The purpose of this program is to help programmers understand how to manipulate strings in Bash.
# It demonstrates basic string operations, including length calculation and character extraction.

# Function to reverse a word
reverse_word() {
    local word="$1"  # The input word to be reversed
    local length=${#word}  # Calculate the length of the word
    local reversed=""  # Initialize an empty string to store the reversed word

    # Loop through each character in the word from the end to the beginning
    for (( i=$length-1; i>=0; i-- )); do
        reversed="$reversed${word:$i:1}"  # Append each character to the reversed string
    done

    echo "$reversed"  # Output the reversed word
}

# Main script execution starts here
if [ $# -ne 1 ]; then  # Check if exactly one argument is provided
    echo "Usage: $0 <word>"  # Print usage information
    exit 1  # Exit with a status code indicating an error
fi

input_word="$1"  # Get the input word from the command line argument
reversed_word=$(reverse_word "$input_word")  # Call the function to reverse the word

echo "Original word: $input_word"  # Print the original word
echo "Reversed word: $reversed_word"  # Print the reversed word

