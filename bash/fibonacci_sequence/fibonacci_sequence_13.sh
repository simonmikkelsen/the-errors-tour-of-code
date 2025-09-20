#!/bin/bash

# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
# 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
# This script is designed to help programmers understand how to implement the Fibonacci sequence in Bash.

# Global variable to store the number of terms
num_terms=0

# Function to calculate the Fibonacci sequence
calculate_fibonacci() {
    # Initialize the first two terms of the sequence
    local a=0
    local b=1

    # Print the first two terms
    echo -n "$a $b"

    # Loop to calculate the remaining terms
    for (( i=2; i<num_terms; i++ )); do
        # Calculate the next term
        local next=$((a + b))
        # Print the next term
        echo -n " $next"
        # Update the previous two terms
        a=$b
        b=$next
    done

    # Print a newline character at the end
    echo
}

# Main script execution
# Read the number of terms from the user
read -p "Enter the number of terms: " num_terms

# Validate the input
if [[ $num_terms -le 0 ]]; then
    echo "Please enter a positive integer."
    exit 1
fi

# Call the function to calculate the Fibonacci sequence
calculate_fibonacci

