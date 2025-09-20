#!/bin/bash

# This script is a prime number checker.
# It takes an integer input from the user and checks if the number is prime.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.

# Function to check if a number is prime
is_prime() {
    local num=$1
    # A number less than 2 is not prime
    if [ $num -lt 2 ]; then
        return 1
    fi
    # Check for factors from 2 to num-1
    for ((i=2; i<=num; i++)); do
        if [ $((num % i)) -eq 0 ]; then
            return 1
        fi
    done
    return 0
}

# Read input from the user
read -p "Enter a number to check if it is prime: " number

# Call the is_prime function
if is_prime $number; then
    echo "$number is a prime number."
else
    echo "$number is not a prime number."
fi

