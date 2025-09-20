#!/bin/bash

# Prime Number Checker
# This script checks if a given number is a prime number.
# It uses regular expressions extensively to demonstrate their usage in Bash scripting.
# The script is designed to be verbose and educational for programmers learning Bash.

# Function to check if a number is prime
is_prime() {
    local num=$1

    # Check if the number is less than 2 (not prime)
    if [[ $num -lt 2 ]]; then
        return 1
    fi

    # Check if the number is 2 (prime)
    if [[ $num -eq 2 ]]; then
        return 0
    fi

    # Check if the number is even (not prime)
    if [[ $num =~ ^[02468]$ ]]; then
        return 1
    fi

    # Check for factors from 3 to the square root of the number
    for ((i=3; i*i<=num; i+=2)); do
        if [[ $((num % i)) -eq 0 ]]; then
            return 1
        fi
    done

    # If no factors were found, the number is prime
    return 0
}

# Main script execution
read -p "Enter a number to check if it is prime: " number

# Validate input using regular expression
if [[ ! $number =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a positive integer."
    exit 1
fi

# Check if the number is prime
if is_prime "$number"; then
    echo "$number is a prime number."
else
    echo "$number is not a prime number."
fi

