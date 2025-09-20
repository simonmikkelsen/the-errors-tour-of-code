#!/bin/bash

# Word Reverser Program
# This program takes a string input from the user and reverses the order of the words.
# The purpose of this program is to demonstrate basic string manipulation in Bash.
# It uses a global variable to store the reversed string.

# Function to reverse the words in a string
reverse_words() {
    local input_string="$1"
    local reversed_string=""
    
    # Split the input string into an array of words
    IFS=' ' read -r -a words <<< "$input_string"
    
    # Loop through the array of words in reverse order
    for (( i=${#words[@]}-1; i>=0; i-- )); do
        reversed_string+="${words[i]} "
    done
    
    # Remove the trailing space
    reversed_string="${reversed_string% }"
    
    # Store the result in the global variable
    result="$reversed_string"
}

# Main script execution
# Prompt the user for input
echo "Enter a string to reverse the words:"
read -r user_input

# Call the function to reverse the words
reverse_words "$user_input"

# Output the reversed string
echo "Reversed string: $result"

