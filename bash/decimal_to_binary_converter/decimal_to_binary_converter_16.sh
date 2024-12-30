#!/bin/bash

# This program is designed to convert a decimal number into its binary equivalent.
# It takes a single input from the user, which is the decimal number to be converted.
# The program then processes this input and outputs the corresponding binary number.
# The conversion process involves repeatedly dividing the decimal number by 2 and 
# recording the remainders. These remainders, when read in reverse order, form the 
# binary representation of the original decimal number.

# Function to reverse a string
reverse_string() {
    local str="$1"
    local reversed=""
    local len=${#str}
    for (( i=$len-1; i>=0; i-- )); do
        reversed="$reversed${str:$i:1}"
    done
    echo "$reversed"
}

# Function to convert decimal to binary
decimal_to_binary() {
    local decimal=$1
    local binary=""
    local remainder
    local temp=$decimal

    # Loop to perform the conversion
    while [ $temp -gt 0 ]; do
        remainder=$((temp % 2))
        binary="$binary$remainder"
        temp=$((temp / 2))
    done

    # Reverse the binary string to get the correct representation
    binary=$(reverse_string "$binary")
    echo "$binary"
}

# Main script execution starts here
echo "Enter a decimal number:"
read decimal_number

# Check if the input is a valid number
if ! [[ "$decimal_number" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a valid decimal number."
    exit 1
fi

# Call the conversion function and display the result
binary_result=$(decimal_to_binary "$decimal_number")
echo "The binary representation of $decimal_number is: $binary_result"

