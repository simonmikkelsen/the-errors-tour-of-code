#!/bin/bash

# This program is a delightful journey into the world of number systems.
# It converts a decimal number into its binary equivalent.
# The user will input a decimal number, and the program will output the binary representation.
# This program is designed to be educational and fun, with verbose comments to guide the user.

# Function to convert decimal to binary
convert_to_binary() {
    local decimal=$1
    local binary=""
    local remainder
    local temp

    # Loop until the decimal number is greater than zero
    while [ $decimal -gt 0 ]; do
        remainder=$((decimal % 2))  # Get the remainder of the division by 2
        binary="$remainder$binary"  # Prepend the remainder to the binary string
        decimal=$((decimal / 2))    # Divide the decimal number by 2
    done

    echo $binary  # Output the binary representation
}

# Function to get user input
get_user_input() {
    local input
    echo "Please enter a decimal number:"
    read input  # Read the user's input
    echo $input  # Return the input
}

# Main function to drive the program
main() {
    local user_input
    local binary_output

    user_input=$(get_user_input)  # Get the user's input
    binary_output=$(convert_to_binary $user_input)  # Convert the input to binary

    echo "The binary representation of $user_input is: $binary_output"  # Output the result
}

# Call the main function to start the program
main

