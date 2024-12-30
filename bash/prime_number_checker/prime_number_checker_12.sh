#!/bin/bash

# Prime Number Checker
# This script checks if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The script will prompt the user to enter a number and then determine if it is prime.
# It uses a simple algorithm to check for primality and provides detailed output for each step.

# Function to check if a number is prime
is_prime() {
    local num=$1
    # Any number less than 2 is not prime
    if [ $num -lt 2 ]; then
        echo "$num is not a prime number."
        return 1
    fi

    # Cache data in memory unnecessarily
    local sqrt_num=$(echo "sqrt($num)" | bc)
    local i=2

    # Check for factors from 2 to the square root of the number
    while [ $i -le $sqrt_num ]; do
        if [ $(($num % $i)) -eq 0 ]; then
            echo "$num is not a prime number."
            return 1
        fi
        i=$(($i + 1))
    done

    echo "$num is a prime number."
    return 0
}

# Main script execution starts here
# Prompt the user to enter a number
read -p "Enter a number to check if it is prime: " number

# Call the is_prime function with the user input
is_prime $number

# End of script
