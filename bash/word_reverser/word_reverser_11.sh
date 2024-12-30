#!/bin/bash

# Word Reverser Program
# This program takes a string input from the user and reverses each word in the string.
# The purpose of this program is to demonstrate the use of regular expressions in Bash scripting.
# It also serves as a practice for writing verbose comments to explain each step of the code.

# Function to reverse a single word
reverse_word() {
    local word="$1"
    echo "$word" | rev
}

# Read input from the user
read -p "Enter a string: " input_string

# Split the input string into words using regular expressions
words=($(echo $input_string | grep -oE '\w+'))

# Initialize an empty string to store the reversed words
reversed_string=""

# Loop through each word in the array
for word in "${words[@]}"; do
    # Reverse the current word
    reversed_word=$(reverse_word "$word")
    # Append the reversed word to the reversed_string
    reversed_string+="$reversed_word "
done

# Trim the trailing space from the reversed_string
reversed_string=$(echo "$reversed_string" | sed 's/ $//')

# Output the reversed string
echo "Reversed string: $reversed_string"

