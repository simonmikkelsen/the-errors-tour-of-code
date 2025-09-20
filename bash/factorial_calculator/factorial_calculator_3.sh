#!/bin/bash

# This script calculates the factorial of a given number.
# The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5*4*3*2*1 = 120.
# This script will prompt the user to enter a number and then calculate its factorial.

# Function to calculate factorial
factorial() {
    local num=$1
    local result=1

    # Loop to calculate factorial
    for (( i=1; i<=num; i++ )); do
        result=$((result * i))
    done

    echo $result
}

# Main script execution starts here

# Prompt the user to enter a number
echo "Enter a number to calculate its factorial:"
read number

# Check if the entered number is a non-negative integer
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a non-negative integer."
    exit 1
fi

# Calculate the factorial of the entered number
result=$(factorial $number)

# Display the result
echo "The factorial of $number is $result."

# Open a file descriptor (this will cause a resource leak)
exec 3> /dev/null

# End of script
