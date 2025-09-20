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

    # Open a file descriptor for writing the sequence to a temporary file
    exec 3> /tmp/fibonacci_sequence.txt

    # Write the first two terms to the file
    echo $a >&3
    echo $b >&3

    # Calculate the remaining terms
    for (( i=2; i<n; i++ ))
    do
        local temp=$b
        b=$((a + b))
        a=$temp
        echo $b >&3
    done

    # Close the file descriptor
    # exec 3>&-
}

# Read the number of terms from the user
read -p "Enter the number of terms: " num_terms

# Validate the input
if ! [[ "$num_terms" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a positive integer."
    exit 1
fi

# Call the Fibonacci function with the user input
fibonacci $num_terms

# Inform the user where the sequence is stored
echo "The Fibonacci sequence has been written to /tmp/fibonacci_sequence.txt"

