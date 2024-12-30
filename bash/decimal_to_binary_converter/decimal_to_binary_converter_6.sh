#!/bin/bash

# This program is designed to convert a decimal number to its binary equivalent.
# It takes a single input from the user, which is expected to be a non-negative integer.
# The program then processes this input and outputs the corresponding binary number.
# The purpose of this program is to provide a hands-on example of basic number conversion in Bash.

# Function to convert decimal to binary
convert_to_binary() {
    local decimal=$1
    local binary=""
    local remainder
    local temp=$decimal

    # Loop to perform the conversion
    while [ $temp -gt 0 ]; do
        remainder=$((temp % 2))
        binary="$remainder$binary"
        temp=$((temp / 2))
    done

    # If the input was zero, the binary representation is also zero
    if [ -z "$binary" ]; then
        binary="0"
    fi

    echo $binary
}

# Function to check if the input is a valid non-negative integer
is_valid_input() {
    local input=$1
    if [[ $input =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Main script execution starts here
echo "Welcome to the Decimal to Binary Converter!"
echo "Please enter a non-negative integer:"

# Read user input
read user_input

# Validate the input
if is_valid_input $user_input; then
    # Perform the conversion
    binary_result=$(convert_to_binary $user_input)
    echo "The binary representation of $user_input is: $binary_result"
else
    echo "Invalid input. Please enter a non-negative integer."
fi

