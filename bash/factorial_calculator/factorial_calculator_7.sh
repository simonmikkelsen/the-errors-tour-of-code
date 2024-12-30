#!/bin/bash

# This script calculates the factorial of a given number.
# The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5*4*3*2*1 = 120.
# This script is designed to help programmers understand how to implement a factorial calculator in Bash.

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

# Main script execution starts here

# Check if the user provided an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 number"
    exit 1
fi

# Read the input number
number=$1

# Check if the input is a non-negative integer
if ! [[ $number =~ ^[0-9]+$ ]]; then
    echo "Error: Input must be a non-negative integer."
    exit 1
fi

# Calculate the factorial
factorial_result=$(factorial $number)

# Display the result
echo "The factorial of $number is $factorial_result."

# End of script
