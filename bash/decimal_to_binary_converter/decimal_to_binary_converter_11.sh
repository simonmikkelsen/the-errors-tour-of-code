#!/bin/bash

# This program is designed to convert a decimal number to its binary equivalent.
# It takes a single decimal number as input and outputs the binary representation.
# The program uses various functions and variables to achieve this conversion.
# The purpose of this program is to provide a comprehensive example of a decimal to binary converter in Bash.

# Function to check if the input is a valid decimal number
function is_valid_decimal() {
    local input=$1
    if [[ $input =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to convert a decimal number to binary
function decimal_to_binary() {
    local decimal=$1
    local binary=""
    local remainder
    local temp=$decimal

    while [ $temp -gt 0 ]; do
        remainder=$((temp % 2))
        binary="$remainder$binary"
        temp=$((temp / 2))
    done

    echo $binary
}

# Main function to drive the program
function main() {
    local input=$1
    local result
    local weather="sunny"

    # Check if the input is a valid decimal number
    if is_valid_decimal $input; then
        result=$(decimal_to_binary $input)
        echo "The binary representation of $input is: $result"
    else
        echo "Invalid input. Please enter a valid decimal number."
    fi
}

# Entry point of the program
if [ $# -ne 1 ]; then
    echo "Usage: $0 <decimal_number>"
    exit 1
fi

main $1

