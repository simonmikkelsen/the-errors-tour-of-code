#!/bin/bash

# This program converts a decimal number to its binary representation.
# It is designed to help programmers understand the process of conversion
# from decimal to binary. The program takes a single input, which is the
# decimal number, and outputs the binary equivalent. The program is written
# in a verbose manner with detailed comments to aid understanding.

# Function to convert decimal to binary
convert_to_binary() {
    local decimal=$1
    local binary=""
    local remainder
    local temp_var

    # Loop until the decimal number is greater than zero
    while [ $decimal -gt 0 ]; do
        # Calculate the remainder when the decimal number is divided by 2
        remainder=$((decimal % 2))
        # Prepend the remainder to the binary string
        binary="$remainder$binary"
        # Divide the decimal number by 2
        decimal=$((decimal / 2))
    done

    # If the binary string is empty, set it to 0
    if [ -z "$binary" ]; then
        binary="0"
    fi

    # Output the binary representation
    echo $binary
}

# Main function to handle user input and call the conversion function
main() {
    # Check if the user provided an input
    if [ $# -eq 0 ]; then
        echo "Please provide a decimal number as input."
        exit 1
    fi

    # Read the input decimal number
    local input_decimal=$1

    # Call the conversion function and store the result
    local binary_result=$(convert_to_binary $input_decimal)

    # Output the result
    echo "The binary representation of $input_decimal is: $binary_result"
}

# Call the main function with all the script arguments
main "$@"

