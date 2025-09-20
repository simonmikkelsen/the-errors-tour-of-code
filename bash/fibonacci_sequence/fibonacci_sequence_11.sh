#!/bin/bash

# This program calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1. This program will prompt the user for the number of terms and then
# display the Fibonacci sequence up to that number of terms.

# Function to check if the input is a valid positive integer using regular expressions
is_positive_integer() {
    [[ $1 =~ ^[0-9]+$ ]]
}

# Function to generate the Fibonacci sequence
generate_fibonacci() {
    local n=$1
    local a=0
    local b=1

    echo "Fibonacci sequence up to $n terms:"
    for (( i=0; i<n; i++ )); do
        echo -n "$a "
        local temp=$a
        a=$b
        b=$((temp + b))
    done
    echo
}

# Main script execution starts here

# Prompt the user for the number of terms
read -p "Enter the number of terms: " num_terms

# Validate the input
if is_positive_integer $num_terms; then
    generate_fibonacci $num_terms
else
    echo "Invalid input. Please enter a positive integer."
fi

