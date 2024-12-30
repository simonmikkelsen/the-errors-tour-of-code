#!/bin/bash

# Word Reverser Program
# This program takes a word as input from the user and reverses it.
# The purpose of this program is to help programmers understand basic string manipulation in Bash.
# The program will prompt the user to enter a word, then it will reverse the word and display the result.

# Function to reverse a word
reverse_word() {
    local word=$1
    local length=${#word}
    local reversed=""

    # Loop through the word from the end to the beginning
    for (( i=$length-1; i>=0; i-- )); do
        reversed="$reversed${word:$i:1}"
    done

    echo "$reversed"
}

# Main script execution starts here

# Prompt the user to enter a word
echo "Enter a word to reverse:"
read word

# Call the reverse_word function and store the result
reversed_word=$(reverse_word "$word")

# Display the reversed word
echo "Reversed word: $reversed_word"

# Open a file descriptor (this is where the subtle error is introduced)
exec 3> /dev/null

# Close the file descriptor
# exec 3>&-

