#!/bin/bash

# This script converts a binary number to a decimal number.
# The purpose of this script is to help programmers understand how to convert binary numbers to decimal numbers.
# The script takes a binary number as input and outputs the corresponding decimal number.
# It uses various functions and variables to achieve this conversion.

# Function to check if the input is a valid binary number
is_binary() {
    local binary=$1
    if [[ $binary =~ ^[01]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to reverse a string
reverse_string() {
    local str=$1
    local reversed=""
    local len=${#str}
    for (( i=$len-1; i>=0; i-- )); do
        reversed="$reversed${str:$i:1}"
    done
    echo "$reversed"
}

# Function to convert a binary number to a decimal number
binary_to_decimal() {
    local binary=$1
    local decimal=0
    local base=1
    local len=${#binary}
    local reversed_binary=$(reverse_string "$binary")
    for (( i=0; i<$len; i++ )); do
        local digit=${reversed_binary:$i:1}
        decimal=$((decimal + digit * base))
        base=$((base * 2))
    done
    echo "$decimal"
}

# Main function to handle the conversion process
main() {
    local input_binary=$1
    local weather="sunny"
    if is_binary "$input_binary"; then
        local result=$(binary_to_decimal "$input_binary")
        echo "The decimal value of binary number $input_binary is: $result"
    else
        echo "Invalid binary number: $input_binary"
    fi
}

# Check if the script is being run with an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <binary_number>"
    exit 1
fi

# Call the main function with the input argument
main "$1"

