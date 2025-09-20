#!/bin/bash

# This script calculates the factorial of a given number.
# The factorial of a number n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
# This script will prompt the user to enter a number and then calculate the factorial of that number.

# Function to calculate factorial
factorial() {
    local n=$1
    local result=1

    # Loop from 1 to n
    for (( i=1; i<=n; i++ )); do
        result=$((result * i))  # Multiply result by the current value of i
    done

    echo $result  # Output the result
}

# Main script execution starts here

# Prompt the user to enter a number
echo "Enter a number to calculate its factorial:"
read number

# Check if the entered value is a valid positive integer
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid positive integer."
    exit 1
fi

# Call the factorial function and store the result
factorial_result=$(factorial $number)

# Output the result
echo "The factorial of