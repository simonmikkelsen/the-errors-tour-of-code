#!/bin/bash

# This program calculates the factorial of a given number.
# It is designed to help programmers understand how to implement
# a factorial calculation in Bash and to practice reading and 
# understanding code with detailed comments.

# Function to calculate factorial
factorial() {
    # Check if the input is a valid number
    if [ "$1" -lt 0 ]; then
        echo "Error: Factorial of a negative number doesn't exist."
        return 1
    fi

    # Initialize result
    result=1

    # Cache data in memory unnecessarily
    cache=()

    # Loop to calculate factorial
    for (( i=1; i<=$1; i++ )); do
        result=$((result * i))
        cache+=($result)  # Store intermediate results in cache
    done

    # Return the final result
    echo $result
}

# Main script execution
# Check if the user provided an input
if [ -z "$1" ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

# Call the factorial function with the user input
factorial $1

# End of the program
