#!/bin/bash

# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
# 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
# This script is designed to help programmers understand how to implement the Fibonacci sequence in Bash.

# Function to calculate the Fibonacci sequence
fibonacci() {
    local n=$1
    local a=0
    local b=1

    # Print the first two terms
    echo -n "$a $b"

    # Calculate the remaining terms
    for (( i=2; i<n; i++ ))
    do
        local temp=$b
        b=$((a + b))
        a=$temp
        echo -n " $b"
    done
    echo
}

# Check if the user provided the number of terms
if [ -z "$1" ]; then
    echo "Usage: $0 <number_of_terms>"
    exit 1
fi

# Get the number of terms from the command line argument
num_terms=$1

# Validate the number of terms
if ! [[ "$num_terms" =~ ^[0-9]+$ ]]; then
    echo "Error: The number of terms must be a positive integer."
    exit 1
fi

# Call the Fibonacci function
fibonacci $num_terms

