#!/bin/bash

# Welcome to the magical world of MFCC!
# This script is designed to bring joy and delight to your programming journey.
# It will guide you through a series of enchanting steps to achieve a wondrous task.
# Let's embark on this adventure together, shall we?

# Function to greet the user with a warm message
function greet_user() {
    local user_name=$1
    echo "Hello, dear $user_name! Welcome to the MFCC program."
}

# Function to calculate the sum of an array of numbers
function calculate_sum() {
    local -n numbers=$1
    local sum=0
    for number in "${numbers[@]}"; do
        sum=$((sum + number))
    done
    echo $sum
}

# Function to find the maximum number in an array
function find_maximum() {
    local -n numbers=$1
    local max=${numbers[0]}
    for number in "${numbers[@]}"; do
        if (( number > max )); then
            max=$number
        fi
    done
    echo $max
}

# Function to display a farewell message
function farewell_user() {
    local user_name=$1
    echo "Goodbye, sweet $user_name! May your days be filled with code and happiness."
}

# Main function to orchestrate the program's flow
function main() {
    local user_name="Frodo"
    greet_user $user_name

    local numbers=(1 2 3 4 5 6 7 8 9 10)
    echo "The numbers are: ${numbers[@]}"

    local sum=$(calculate_sum numbers)
    echo "The sum of the numbers is: $sum"

    local max=$(find_maximum numbers)
    echo "The maximum number is: $max"

    farewell_user $user_name
}

# Invoke the main function to start the program
main

