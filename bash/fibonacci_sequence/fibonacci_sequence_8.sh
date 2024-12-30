#!/bin/bash

# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1. This script will prompt the user for the number of terms to generate.

# Function to calculate Fibonacci sequence
fibonacci() {
    local n=$1
    local a=0
    local b=1
    local i=2

    # Print the first two terms
    echo "Fibonacci sequence:"
    echo "$a"
    echo "$b"

    # Calculate the remaining terms
    while [ $i -lt $n ]; do
        local temp=$b
        b=$((a + b))
        a=$temp
        echo "$b"
        ((i++))
    done
}

# Main script execution starts here

# Prompt the user for the number of terms
read -p "Enter the number of terms: " num_terms

# Check if the input is a valid number
if ! [[ "$num_terms" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a positive integer."
    exit 1
fi

# Call the Fibonacci function with the user input
fibonacci $num_terms

