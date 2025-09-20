#!/bin/bash

# This program is called "word reverser".
# It takes a single word as input and reverses the characters in the word.
# The reversed word is then printed to the console.
# This program is designed to help programmers practice their Bash scripting skills.

# Function to reverse a word
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

# Read a word from the user
echo "Enter a word to reverse:"
read input_word

# Call the reverse_word function and store the result
reversed_word=$(reverse_word $input_word)

# Print the reversed word
echo "Reversed word: $reversed_word"

# End of the program
