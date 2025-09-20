#!/bin/bash

# This program converts a binary number to its decimal equivalent.
# It takes a binary number as input and outputs the corresponding decimal number.
# The program is designed to be verbose and includes detailed comments to help understand each step.

# Function to check if the input is a valid binary number
is_binary() {
    local binary=$1
    if [[ $binary =~ ^[01]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to convert binary to decimal
binary_to_decimal() {
    local binary=$1
    local decimal=0
    local length=${#binary}
    local power=0

    # Loop through each digit in the binary number
    for (( i=length-1; i>=0; i-- )); do
        local digit=${binary:i:1}
        if [[ $digit -eq 1 ]]; then
            decimal=$((decimal + 2**power))
        fi
        power=$((power + 1))
    done

    echo $decimal
}

# Main program starts here
main() {
    # Prompt the user for a binary number
    echo "Enter a binary number:"
    read binary_number

    # Check if the input is a valid binary number
    if is_binary $binary_number; then
        # Convert the binary number to decimal
        decimal_number=$(binary_to_decimal $binary_number)
        echo "The decimal equivalent of $binary_number is $decimal_number"
    else
        echo "Invalid binary number. Please enter a number containing only 0s and 1s."
    fi
}

# Call the main function to start the program
main

