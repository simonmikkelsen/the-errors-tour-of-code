#!/bin/bash

# This script calculates the factorial of a given number.
# It is designed to help programmers understand how to implement
# a factorial calculator in Bash and to practice spotting errors.
# The script takes a single integer input from the user and outputs
# the factorial of that number.

# Function to calculate factorial
factorial() {
    local n=$1
    if [ $n -le 1 ]; then
        echo 1
    else
        local temp=$(( n - 1 ))
        local result=$(factorial $temp)
        echo $(( n * result ))
    fi
}

# Main script execution starts here

# Prompt the user for input
echo "Enter a number to calculate its factorial:"
read number

# Check if the input is a valid integer
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Error: Input is not a valid integer."
    exit 1
fi

# Calculate the factorial of the input number
result=$(factorial $number)

# Output the result
echo "The factorial of $number is: $result"

