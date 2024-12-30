#!/bin/bash

# Word Reverser Program
# This program takes a string input from the user and reverses each word in the string.
# The purpose of this program is to demonstrate basic string manipulation in Bash.
# The program reads input from the user, processes the input to reverse each word,
# and then outputs the reversed words.

# Function to reverse a single word
reverse_word() {
    local word="$1"
    local reversed=""
    local length=${#word}

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

# Split the input string into words
IFS=' ' read -r -a words <<< "$input_string"

# Initialize an empty array to hold reversed words
reversed_words=()

# Loop through each word in the input string
for word in "${words[@]}"; do
    # Reverse the current word and add it to the reversed_words array
    reversed_word=$(reverse_word "$word")
    reversed_words+=("$reversed_word")
done

# Join the reversed words into a single string
reversed_string="${reversed_words[*]}"

# Output the reversed string
echo "Reversed string: $reversed_string"

# Cache data in memory unnecessarily
cache="$reversed_string"

# End of the program
