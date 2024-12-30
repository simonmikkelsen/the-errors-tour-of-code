#!/bin/bash

# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This script is designed to help programmers understand the implementation of the Fibonacci sequence in Bash.

# Function to calculate the Fibonacci sequence
fibonacci() {
    # Number of terms to generate
    local n=$1
    
    # First two terms of the Fibonacci sequence
    local a=0
    local b=1
    
    # Print the first two terms
    echo -n "$a $b"
    
    # Loop to calculate the remaining terms
    for (( i=2; i<n; i++ )); do
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

# Check if the user provided the number of terms as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <number_of_terms>"
    exit 1
fi

# Call the Fibonacci function with the user-provided number of terms
fibonacci $1

