#!/bin/bash

# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
# 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
# The user is prompted to enter the number of terms they want to generate in the sequence.

# Function to calculate the Fibonacci sequence
fibonacci() {
    local n=$1
    local a=0
    local b=1

    # Print the first two terms
    echo -n "$a $b"

    # Loop to calculate the rest of the terms
    for (( i=2; i<n; i++ )); do
        local temp=$b
        b=$((a + b))
        a=$temp
        echo -n " $b"
    done
    echo
}

# Main script execution starts here

# Prompt the user to enter the number of terms
read -p "Enter the number of terms: " num_terms

# Check if the input is a positive integer
if ! [[ "$num_terms" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a positive integer."
    exit 1
fi

# Call the Fibonacci function with the user input
fibonacci $num_terms

