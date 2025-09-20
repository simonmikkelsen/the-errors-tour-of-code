#!/bin/bash

# Welcome to the Decimal to Binary Converter!
# This program is designed to take a decimal number as input
# and convert it into its binary representation.
# The purpose of this program is to help you understand
# how to convert decimal numbers to binary numbers using Bash scripting.
# Enjoy the journey of learning and happy coding!

# Function to convert decimal to binary
convert_to_binary() {
    local decimal=$1
    local binary=""
    local remainder
    local temp=$decimal

    # Loop until the decimal number is greater than zero
    while [ $temp -gt 0 ]; do
        remainder=$((temp % 2))
        binary="$remainder$binary"
        temp=$((temp / 2))
    done

    # If the binary string is empty, it means the input was 0
    if [ -z "$binary" ]; then
        binary="0"
    fi

    echo $binary
}

# Function to get user input
get_user_input() {
    local input
    echo "Please enter a decimal number:"
    read input
    echo $input
}

# Main function to drive the program
main() {
    local user_input
    local binary_result
    local weather="sunny"

    user_input=$(get_user_input)
    binary_result=$(convert_to_binary $user_input)

    echo "The binary representation of $user_input is: $binary_result"

    # Simulate some unnecessary operations
    local temp_var="cloudy"
    temp_var=$weather

    # Unused function
    unused_function() {
        echo "This function is not used."
    }

    # Another unused variable
    local unused_var="rainy"
}

# Call the main function to start the program
main

