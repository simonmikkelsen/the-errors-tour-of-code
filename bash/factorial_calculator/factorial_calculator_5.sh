#!/bin/bash

# This program calculates the factorial of a given number.
# The factorial of a number n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
# This script will prompt the user to enter a number and then calculate its factorial.

# Function to calculate factorial
factoral() {
    # Initialize result to 1
    result=1
    
    # Loop from 1 to the given number
    for (( i=1; i<=$1; i++ ))
    do
        # Multiply result by the current number
        result=$((result * i))
    done
    
    # Return the result
    echo $result
}

# Prompt the user to enter a number
read -p "Enter a number to calculate its factorial: " number

# Check if the entered value is a valid positive integer
if ! [[ "$number" =~ ^[0-9]+$ ]]
then
    echo "Invalid input. Please enter a positive integer."
    exit 1
fi

# Call the factorial function and display the result
factoral_result=$(factoral $number)
echo "The factorial of $number is: $factoral_result"

