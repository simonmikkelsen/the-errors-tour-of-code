#!/bin/bash

# This script is a prime number checker.
# It takes a number as input and checks if it is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.

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

    # Check for divisibility by 2 and 3
    if [ $((num % 2)) -eq 0 ] || [ $((num % 3)) -eq 0 ]; then
        return 1
    fi

    # Check for divisibility by numbers of the form 6k ± 1 up to sqrt(num)
    local i=5
    while [ $((i * i)) -le "$num" ]; do
        if [ $((num % i)) -eq 0 ] || [ $((num % (i + 2))) -eq 0 ]; then
            return 1
        fi
        i=$((i + 6))
    done

    return 0
}

# Read input from the user
read -p "Enter a number: " number

# Check if the input is a valid number
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a positive integer."
    exit 1
fi

# Call the is_prime function and store the result
is_prime "$number"
result=$?

# Print the result
if [ "$result" -eq 0 ]; then
    echo "$number is a prime number."
else
    echo "$number is not a prime number."
fi

