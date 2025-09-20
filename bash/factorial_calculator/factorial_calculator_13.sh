#!/bin/bash

# This script calculates the factorial of a given number.
# The purpose of this script is to demonstrate how to write a Bash script
# that performs a mathematical calculation using loops and functions.
# The script will prompt the user to enter a number and then calculate
# the factorial of that number using a recursive function.

# Global variable to store the result of the factorial calculation
factorial_result=1

# Function to calculate the factorial of a number
# This function uses recursion to calculate the factorial
calculate_factorial() {
    local number=$1
    if [ $number -le 1 ]; then
        factorial_result=1
    else
        calculate_factorial $((number - 1))
        factorial_result=$((factorial_result * number))
    fi
}

# Main script execution starts here

# Prompt the user to enter a number
echo "Enter a number to calculate its factorial:"
read number

# Validate the input to ensure it is a positive integer
if ! [[ $number =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a positive integer."
    exit 1
fi

# Call the function to calculate the factorial
calculate_factorial $number

# Display the result
echo "The factorial of $number is: $factorial_result"

# End of script
