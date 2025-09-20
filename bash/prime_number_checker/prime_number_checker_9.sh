#!/bin/bash

# This script is a prime number checker.
# It takes a number as input and checks if it is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.

# Function to check if a number is prime
is_prime() {
    local num=$1

    # 0 and 1 are not prime numbers
    if [ $num -le 1 ]; then
        echo "$num is not a prime number."
        return 1
    fi

    # Check for factors from 2 to the square root of the number
    for ((i = 2; i * i <= num; i++)); do
        if [ $((num % i)) -eq 0 ]; then
            echo "$num is not a prime number."
            return 1
        fi
    done

    # If no factors were found, the number is prime
    echo "$num is a prime number."
    return 0
}

# Read input from the user
read -p "Enter a number to check if it is prime: " number

# Call the is_prime function with the user input
is_prime $number

