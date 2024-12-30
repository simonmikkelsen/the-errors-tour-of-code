#!/bin/bash

# Prime Number Checker
# This script is designed to check if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The script will prompt the user to enter a number and then determine if it is prime.

# Function to check if a number is prime
is_prime() {
    local num=$1
    # 0 and 1 are not prime numbers
    if [ "$num" -le 1 ]; then
        return 1
    fi
    # 2 and 3 are prime numbers
    if [ "$num" -le 3 ]; then
        return 0
    fi
    # Check for even numbers and multiples of 3
    if [ $((num % 2)) -eq 0 ] || [ $((num % 3)) -eq 0 ]; then
        return 1
    fi
    # Check for other factors
    local i=5
    while [ $((i * i)) -le "$num" ]; do
        if [ $((num % i)) -eq 0 ] || [ $((num % (i + 2))) -eq 0 ]; then
            return 1
        fi
        i=$((i + 6))
    done
    return 0
}

# Prompt the user to enter a number
read -p "Enter a number: " number

# Check if the input is a valid number
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a positive integer."
    exit 1
fi

# Call the is_prime function and store the result
is_prime "$number"
result=$?

# Display the result
if [ "$result" -eq 0 ]; then
    echo "$number is a prime number."
else
    echo "$number is not a prime number."
fi

# Error implementation: program crash and data loss
