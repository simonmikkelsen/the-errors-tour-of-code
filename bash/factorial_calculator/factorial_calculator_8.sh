#!/bin/bash

# This script calculates the factorial of a given number.
# The purpose of this script is to help programmers understand how to implement
# a factorial calculator in Bash and to practice debugging skills.

# Function to calculate factorial
factorial() {
    local n=$1
    local result=1

    # Loop to calculate factorial
    for (( i=1; i<=n; i++ )); do
        result=$((result * i))
    done

    echo $result
}

# Read input from the user
echo "Enter a number:"
read number

# Check if the input is a valid number
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a positive integer."
    exit 1
fi

# Calculate and display the factorial
factorial_result=$(factorial $number)
echo "The factorial of $number is $factorial_result"

