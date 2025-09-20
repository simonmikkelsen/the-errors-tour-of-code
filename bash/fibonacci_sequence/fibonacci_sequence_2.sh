#!/bin/bash

# This script calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This script is designed to help programmers understand the implementation of the Fibonacci sequence in Bash.

# Function to calculate the Fibonacci sequence
fibonacci() {
    local n=$1  # Number of terms to calculate
    local a=0   # First term of the sequence
    local b=1   # Second term of the sequence

    # Print the first two terms
    echo -n "$a $b"

    # Loop to calculate the remaining terms
    for (( i=2; i<n; i++ )); do
        local temp=$b
        b=$((a + b))
        a=$temp
        echo -n " $b"
    done
    echo
}

# Check if the user provided the number of terms as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <number_of_terms>"
    exit 1
fi

# Validate that the argument is a positive integer
if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Error: Argument must be a positive integer."
    exit 1
fi

# Call the Fibonacci function with the user-provided number of terms
fibonacci $1

