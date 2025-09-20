#!/bin/bash

# This script calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1. This script will prompt the user to enter the number of terms
# and then display the Fibonacci sequence up to that number of terms.

# Function to calculate the Fibonacci sequence
fibonacci() {
    # Initialize the first two terms of the Fibonacci sequence
    local n=$1
    local a=0
    local b=1

    # Print the first term
    echo -n "$a "

    # Loop to calculate the remaining terms
    for (( i=1; i<n; i++ ))
    do
        # Print the next term
        echo -n "$b "

        # Calculate the next term by adding the previous two terms
        local temp=$b
        b=$((a + b))
        a=$temp
    done

    # Print a newline character at the end
    echo
}

# Prompt the user to enter the number of terms
read -p "Enter the number of terms: " num_terms

# Validate the input to ensure it is a positive integer
if ! [[ "$num_terms" =~ ^[0-9]+$ ]] || [ "$num_terms" -le 0 ]; then
    echo "Please enter a positive integer."
    exit 1
fi

# Call the fibonacci function with the user input
fibonacci $num_terms

