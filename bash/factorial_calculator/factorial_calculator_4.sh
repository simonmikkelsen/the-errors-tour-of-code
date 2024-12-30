#!/bin/bash

# This script calculates the factorial of a given number.
# The purpose of this script is to help programmers understand how to implement
# a factorial calculator in Bash. The script will prompt the user to enter a number
# and then calculate the factorial of that number using a while loop.
# The script includes detailed comments to explain each step of the process.

# Function to calculate factorial
factorial() {
    local num=$1
    local result=1

    # Loop to calculate factorial
    while [ $num -gt 0 ]; do
        result=$((result * num))
        num=$((num - 1))
    done

    echo $result
}

# Main script execution starts here

# Prompt the user to enter a number
echo "Enter a number to calculate its factorial:"
read number

# Check if the input is a valid number
if ! [[ $number =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a positive integer."
    exit 1
fi

# Call the factorial function and display the result
echo "The factorial of $number is: $(factorial $number)"

# End of script
