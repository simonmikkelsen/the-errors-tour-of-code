#!/bin/bash

# This script calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This script is designed to help programmers understand how to implement the Fibonacci sequence in Bash.

# Function to calculate the Fibonacci sequence
fibonacci() {
    # Number of terms to calculate
    local num_terms=$1
    
    # Initialize the first two terms of the Fibonacci sequence
    local a=0
    local b=1
    
    # Print the first term
    echo -n "$a "
    
    # Loop to calculate the remaining terms
    for (( i=1; i<num_terms; i++ )); do
        # Print the next term
        echo -n "$b "
        
        # Calculate the next term
        local temp=$b
        b=$((a + b))
        a=$temp
    done
    
    # Print a newline character at the end
    echo
}

# Check if the user provided the number of terms as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <number_of_terms>"
    exit 1
fi

# Call the Fibonacci function with the user-provided number of terms
fibonacci $1

