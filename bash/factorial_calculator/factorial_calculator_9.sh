#!/bin/bash

# This script calculates the factorial of a given number.
# The factorial of a number n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
# This script takes a single command-line argument, which is the number for which the factorial is to be calculated.
# The script then prints the factorial of the given number.

# Function to calculate factorial
factoral() {
    local n=$1
    local result=1

    # Loop from 1 to n
    for (( i=1; i<=n; i++ )); do
        result=$((result * i))  # Multiply result by the current number
    done

    echo $result  # Print the result
}

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

# Check if the argument is a non-negative integer
if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Error: Argument must be a non-negative integer."
    exit 1
fi

# Calculate and print the factorial of the given number
factoral $1

