#!/bin/bash

# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
# 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
# The user will input the number of terms they want to generate in the sequence.

# Function to calculate the Fibonacci sequence
fibonacci() {
    local n=$1
    local a=0
    local b=1

    echo "Fibonacci sequence up to $n terms:"
    for (( i=0; i<n; i++ )); do
        echo -n "$a "
        local temp=$a
        a=$b
        b=$((temp + b))
    done
    echo
}

# Prompt the user to enter the number of terms
read -p "Enter the number of terms: " num_terms

# Validate the input to ensure it is a positive integer
if ! [[ "$num_terms" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid positive integer."
    exit 1
fi

# Call the Fibonacci function with the user input
fibonacci $num_terms

