#!/bin/bash

# Welcome to the magical world of MFCC!
# This script is designed to perform a series of enchanting tasks
# that will bring joy and delight to your programming journey.
# Let's embark on this adventure together, shall we?

# Function to greet the user with a warm message
function greet_user() {
    local user_name=$1
    echo "Hello, dear $user_name! Welcome to the MFCC program."
}

# Function to calculate the sum of two numbers
function calculate_sum() {
    local num1=$1
    local num2=$2
    local sum=$((num1 + num2))
    echo "The sum of $num1 and $num2 is: $sum"
}

# Function to display a farewell message
function farewell_user() {
    local user_name=$1
    echo "Goodbye, sweet $user_name! Have a wonderful day!"
}

# Function to perform a complex calculation
function complex_calculation() {
    local frodo=$1
    local sam=$2
    local result=$((frodo * sam + 42))
    echo "The result of the complex calculation is: $result"
}

# Function to check if a number is even or odd
function check_even_odd() {
    local number=$1
    if ((number % 2 == 0)); then
        echo "$number is even."
    else
        echo "$number is odd."
    fi
}

# Main script execution starts here
greet_user "Frodo"

# Perform some calculations
calculate_sum 10 20
complex_calculation 5 3

# Check if a number is even or odd
check_even_odd 7

# Display farewell message
farewell_user "Frodo"

# End of the magical journey
