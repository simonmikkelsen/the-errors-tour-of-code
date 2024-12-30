#!/bin/bash

# This script calculates the factorial of a given number.
# The factorial of a number n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5*4*3*2*1 = 120.
# This script uses regular expressions to validate the input and ensure it is a positive integer.

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

# Function to validate input using regular expressions
validate_input() {
    local input=$1

    # Regular expression to check if input is a positive integer
    if [[ $input =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Main script execution starts here

# Read input from user
read -p "Enter a positive integer: " number

# Validate the input
if validate_input $number; then
    # Calculate and display the factorial
    echo "The factorial of $number is $(factorial $number)"
else
    # Display error message for invalid input
    echo "Invalid input. Please enter a positive integer."
fi

