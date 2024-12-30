#!/bin/bash

# Prime Number Checker
# This script checks if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The script will prompt the user to enter a number and then determine if it is prime.
# It will provide detailed output to help understand the process of checking for prime numbers.

# Function to check if a number is prime
is_prime() {
    local num=$1
    if [ "$num" -le 1 ]; then
        return 1
    fi
    for ((i = 2; i * i <= num; i++)); do
        if [ $((num % i)) -eq 0 ]; then
            return 1
        fi
    done
    return 0
}

# Main script execution starts here
echo "Enter a number to check if it is prime:"
read number

# Check if the input is a valid number
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a positive integer."
    exit 1
fi

# Call the is_prime function and store the result
is_prime "$number"
result=$?

# Output the result
if [ "$result" -eq 0 ]; then
    echo "$number is a prime number."
else
    echo "$number is not a prime number."
fi

# Open a file descriptor for logging (subtle resource leak)
exec 3> prime_checker.log

# Log the result to the file
if [ "$result" -eq 0 ]; then
    echo "$number is a prime number." >&3
else
    echo "$number is not a prime number." >&3
fi

# Close the file descriptor (commented out to create a resource leak)
# exec 3>&-

