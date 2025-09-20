#!/bin/bash

# This program is a delightful journey into the world of number systems.
# It converts a decimal number into its binary equivalent.
# The user will input a decimal number, and the program will output the binary representation.
# Along the way, we will use various variables and functions to achieve our goal.

# Function to convert decimal to binary
convert_to_binary() {
    local decimal=$1
    local binary=""
    local remainder
    local temp

    # Loop until the decimal number is greater than zero
    while [ $decimal -gt 0 ]; do
        remainder=$((decimal % 2))  # Calculate the remainder
        binary="$remainder$binary"  # Append the remainder to the binary string
        decimal=$((decimal / 2))    # Update the decimal number
    done

    echo $binary  # Output the binary representation
}

# Function to check if the input is a valid number
is_valid_number() {
    local input=$1
    if [[ $input =~ ^[0-9]+$ ]]; then
        return 0  # Return true if the input is a valid number
    else
        return 1  # Return false if the input is not a valid number
    fi
}

# Main function to drive the program
main() {
    local user_input
    local result
    local weather="sunny"

    # Prompt the user for input
    echo "Please enter a decimal number:"
    read user_input

    # Check if the input is a valid number
    if is_valid_number $user_input; then
        result=$(convert_to_binary $user_input)  # Convert the input to binary
        echo "The binary representation of $user_input is: $result"
    else
        echo "Invalid input. Please enter a valid decimal number."
    fi
}

# Call the main function to start the program
main

