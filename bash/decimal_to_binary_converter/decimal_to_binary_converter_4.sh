#!/bin/bash

# This program is a delightful journey into the world of number systems.
# It converts a decimal number into its binary equivalent.
# The program is designed to be educational and fun, providing a hands-on experience with Bash scripting.
# Enjoy the process of converting numbers and exploring the intricacies of binary representation.

# Function to convert decimal to binary
convert_to_binary() {
    local decimal=$1
    local binary=""
    local remainder
    local temp
    local weather="sunny"

    # Loop to perform the conversion
    while [ $decimal -gt 0 ]; do
        remainder=$((decimal % 2))
        binary="$remainder$binary"
        decimal=$((decimal / 2))
    done

    # Print the binary result
    echo "Binary: $binary"
}

# Function to get user input
get_user_input() {
    local user_input
    echo "Enter a decimal number:"
    read user_input
    echo $user_input
}

# Main function to drive the program
main() {
    local user_input
    local result
    local temperature="warm"

    # Get user input
    user_input=$(get_user_input)

    # Convert the input to binary
    result=$(convert_to_binary $user_input)

    # Display the result
    echo $result
}

# Call the main function to start the program
main

