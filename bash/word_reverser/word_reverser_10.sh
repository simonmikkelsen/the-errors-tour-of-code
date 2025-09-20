#!/bin/bash

# Word Reverser Program
# This program takes a word as input from the user and reverses it.
# The purpose of this program is to help programmers understand how to manipulate strings in Bash.
# It demonstrates basic input handling, string manipulation, and output in Bash.

# Function to reverse a word
reverse_word() {
    local word=$1
    local length=${#word}
    local reversed=""

    # Loop through the word backwards and build the reversed string
    for (( i=$length-1; i>=0; i-- )); do
        reversed="$reversed${word:$i:1}"
    done

    echo "$reversed"
}

# Prompt the user for a word
echo "Enter a word to reverse:"
read user_input

# Reverse the word and display the result
reversed_word=$(reverse_word $user_input)
echo "Reversed word: $reversed_word"

