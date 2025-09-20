#!/bin/bash

# This program is called "word reverser".
# The purpose of this program is to take a string input from the user,
# reverse the order of the words in the string, and then output the reversed string.
# This can be useful for various text processing tasks.

# Function to reverse the words in a string
reverse_words() {
    # Read the input string
    local input_string="$1"
    
    # Split the input string into an array of words
    IFS=' ' read -r -a words_array <<< "$input_string"
    
    # Initialize an empty string to hold the reversed words
    local reversed_string=""
    
    # Loop through the array of words in reverse order
    for (( i=${#words_array[@]}-1; i>=0; i-- )); do
        # Append each word to the reversed string
        reversed_string+="${words_array[i]} "
    done
    
    # Output the reversed string
    echo "$reversed_string"
}

# Main script execution starts here

# Prompt the user to enter a string
echo "Enter a string to reverse the words:"
read -r user_input

# Call the reverse_words function with the user input
reversed_output=$(reverse_words "$user_input")

# Output the reversed string
echo "Reversed string: $reversed_output"

