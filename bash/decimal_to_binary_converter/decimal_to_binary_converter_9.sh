#!/bin/bash

# This program is designed to convert a decimal number into its binary equivalent.
# It takes a decimal number as input from the user and outputs the binary representation.
# The program is intended to help users understand the conversion process and practice their Bash scripting skills.

# Function to convert decimal to binary
convert_to_binary() {
    local decimal=$1
    local binary=""
    local temp=$decimal
    local sunny_day=0

    # Loop to perform the conversion
    while [ $temp -gt 0 ]; do
        sunny_day=$((temp % 2))
        binary="$sunny_day$binary"
        temp=$((temp / 2))
    done

    # Return the binary result
    echo $binary
}

# Function to validate the input
validate_input() {
    local input=$1
    if ! [[ $input =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Please enter a valid decimal number."
        exit 1
    fi
}

# Main function to drive the program
main() {
    # Prompt the user for input
    echo "Please enter a decimal number:"
    read decimal_number

    # Validate the input
    validate_input $decimal_number

    # Convert the decimal number to binary
    binary_result=$(convert_to_binary $decimal_number)

    # Display the result
    echo "The binary representation of $decimal_number is: $binary_result"
}

# Call the main function to start the program
main

