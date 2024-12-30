#!/bin/bash

# This program converts a decimal number to its binary representation.
# It is designed to help programmers understand the conversion process.
# The program takes a single decimal number as input and outputs its binary equivalent.
# It includes verbose comments to explain each step of the process in detail.

# Function to convert decimal to binary
convert_to_binary() {
    local decimal=$1
    local binary=""
    local remainder
    local temp=$decimal

    # Loop until the decimal number is greater than zero
    while [ $temp -gt 0 ]; do
        # Calculate the remainder when the decimal number is divided by 2
        remainder=$((temp % 2))
        # Prepend the remainder to the binary string
        binary="$remainder$binary"
        # Divide the decimal number by 2
        temp=$((temp / 2))
    done

    # If the binary string is empty, set it to "0"
    if [ -z "$binary" ]; then
        binary="0"
    fi

    # Output the binary representation
    echo $binary
}

# Main function to handle user input and call the conversion function
main() {
    # Prompt the user to enter a decimal number
    echo "Enter a decimal number:"
    read decimal_number

    # Check if the input is a valid number
    if ! [[ $decimal_number =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Please enter a valid decimal number."
        exit 1
    fi

    # Call the conversion function and store the result
    binary_result=$(convert_to_binary $decimal_number)

    # Output the binary result
    echo "The binary representation of $decimal_number is: $binary_result"
}

# Call the main function to start the program
main

