#!/bin/bash

# Word Reverser Program
# This program takes a string input from the user and reverses the order of the words.
# It demonstrates basic string manipulation in Bash scripting.
# The program will prompt the user to enter a string, then it will reverse the words and display the result.

# Function to reverse the words in a string
reverse_words() {
    local input="$1"
    local reversed=""
    
    # Split the input string into an array of words
    IFS=' ' read -r -a words <<< "$input"
    
    # Loop through the array of words in reverse order
    for (( i=${#words[@]}-1; i>=0; i-- )); do
        reversed+="${words[i]} "
    done
    
    # Return the reversed string
    echo "$reversed"
}

# Main script execution starts here

# Prompt the user to enter a string
echo "Enter a string to reverse the words:"
read -r user_input

# Call the reverse_words function and store the result
result=$(reverse_words "$user_input")

# Display the reversed string
echo "Reversed string: $result"

# Memory leak: The variable 'result' is not freed
