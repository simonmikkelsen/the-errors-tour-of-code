#!/bin/bash

# This program checks if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will prompt the user to enter a number and then determine if it is prime.
# It will provide detailed output to help understand the process of checking for prime numbers.

# Function to check if a number is prime
is_prime() {
    local num=$1

    # A number less than 2 is not prime
    if [ "$num" -lt 2 ]; then
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

# Prompt the user to enter a number
read -p "Enter a number to check if it is prime: " input

# Call the is_prime function with the user input
is_prime "$input"

