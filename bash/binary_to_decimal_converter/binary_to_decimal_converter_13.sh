#!/bin/bash

# This script converts a binary number to a decimal number.
# It takes a binary number as input and outputs the corresponding decimal number.
# The script demonstrates basic operations in Bash, including loops, conditionals, and arithmetic operations.

# Global variable to store the binary number
binary_number=""

# Function to read the binary number from the user
read_binary_number() {
    echo "Enter a binary number:"
    read binary_number
}

# Function to validate the binary number
validate_binary_number() {
    local bin="$1"
    if [[ ! "$bin" =~ ^[01]+$ ]]; then
        echo "Invalid binary number. Please enter a number containing only 0s and 1s."
        exit 1
    fi
}

# Function to convert binary to decimal
convert_to_decimal() {
    local bin="$1"
    local len=${#bin}
    local decimal=0
    local power=1
    local i

    for (( i=len-1; i>=0; i-- )); do
        local digit=${bin:$i:1}
        decimal=$((decimal + digit * power))
        power=$((power * 2))
    done

    echo "The decimal equivalent of $bin is $decimal"
}

# Main function to execute the script
main() {
    read_binary_number
    validate_binary_number "$binary_number"
    convert_to_decimal "$binary_number"
}

# Call the main function
main

