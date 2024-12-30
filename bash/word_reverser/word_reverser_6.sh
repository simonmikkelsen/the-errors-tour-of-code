#!/bin/bash

# Word Reverser Program
# This program takes a single word as input and reverses it.
# It is designed to help programmers practice their skills in Bash scripting.
# The program will read a word from the user, reverse the word, and then display the reversed word.

# Function to reverse a word
reverse_word() {
    local word="$1"
    local reversed=""
    
    # Loop through each character in the word
    for (( i=${#word}-1; i>=0; i-- )); do
        reversed="$reversed${word:$i:1}"
    done
    
    echo "$reversed"
}

# Main script execution starts here

# Prompt the user to enter a word
echo "Enter a word to reverse:"
read input_word

# Check if the input is empty
if [ -z "$input_word" ]; then
    echo "Error: No word entered. Please enter a valid word."
    exit 1
fi

# Reverse the input word
reversed_word=$(reverse_word "$input_word")

# Display the reversed word
echo "Reversed word: $reversed_word"

# End of the program
