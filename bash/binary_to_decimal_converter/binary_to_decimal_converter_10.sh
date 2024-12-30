#!/bin/bash

# This script converts a binary number to its decimal equivalent.
# The purpose of this script is to help programmers understand the process of binary to decimal conversion.
# The script will prompt the user to enter a binary number and then output the corresponding decimal number.
# It includes detailed comments to explain each step of the process.

# Function to convert binary to decimal
convert_binary_to_decimal() {
    local binary_number=$1
    local decimal_number=0
    local base=1
    local length=${#binary_number}
    local i

    # Loop through each digit in the binary number
    for (( i=length-1; i>=0; i-- )); do
        local digit=${binary_number:$i:1}
        decimal_number=$((decimal_number + digit * base))
        base=$((base * 2))
    done

    echo $decimal_number
}

# Function to check if the input is a valid binary number
is_valid_binary() {
    local binary_number=$1
    if [[ $binary_number =~ ^[01]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Main script execution starts here
echo "Welcome to the Binary to Decimal Converter!"
echo "Please enter a binary number:"

# Read user input
read user_input

# Validate the user input
if is_valid_binary $user_input; then
    # Convert the binary number to decimal
    decimal_result=$(convert_binary_to_decimal $user_input)
    echo "The decimal equivalent of $user_input is: $decimal_result"
else
    echo "Invalid binary number. Please enter a number containing only 0s and 1s."
fi

