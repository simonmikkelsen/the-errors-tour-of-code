#!/bin/bash

# Prime Number Checker
# This program checks if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will prompt the user to enter a number and then determine if it is prime.
# It uses a global variable to store the number and checks its divisibility by all numbers less than its square root.

# Global variable to store the number to be checked
number=0

# Function to check if a number is prime
is_prime() {
    # Local variable to store the square root of the number
    local sqrt=$(echo "sqrt($number)" | bc)
    
    # Check divisibility from 2 to the square root of the number
    for ((i=2; i<=sqrt; i++)); do
        if (( number % i == 0 )); then
            return 1
        fi
    done
    return 0
}

# Main script execution
read -p "Enter a number to check if it is prime: " number

# Check if the number is less than 2
if (( number < 2 )); then
    echo "$number is not a prime number."
    exit 0
fi

# Call the is_prime function
if is_prime; then
    echo "$number is a prime number."
else
    echo "$number is not a prime number."
fi

