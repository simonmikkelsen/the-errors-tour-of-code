#!/bin/bash

# Word Reverser Program
# This program takes a string input from the user and reverses each word in the string.
# The purpose of this program is to help programmers understand how to manipulate strings in Bash.
# The program will prompt the user for input, process the input to reverse each word, and then display the reversed words.

# Function to reverse a single word
reverse_word() {
    local word=$1
    local length=${#word}
    local reversed=""
    
    # Loop through each character in the word from end to start
    for (( i=$length-1; i>=0; i-- )); do
        reversed="$reversed${word:$i:1}"
    done
    
    echo "$reversed"
}

# Main script execution starts here

# Prompt the user for input
echo "Enter a string to reverse each word:"
read input_string

# Split the input string into an array of words
IFS=' ' read -r -a words <<< "$input_string"

# Initialize an empty string to hold the reversed words
reversed_string=""

# Loop through each word in the array
for word in "${words[@]}"; do
    # Reverse the current word and append it to the reversed_string
    reversed_word=$(reverse_word "$word")
    reversed_string="$reversed_string$reversed_word "
done

# Display the reversed string to the user
echo "Reversed string: $reversed_string"

