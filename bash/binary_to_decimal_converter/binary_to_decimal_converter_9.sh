#!/bin/bash

# This script converts a binary number to a decimal number.
# The user is prompted to enter a binary number, and the script
# will output the corresponding decimal number.
# This script is intended to help programmers understand the process
# of converting binary numbers to decimal numbers.

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
    local base=1
    local length=${#binary}
    local i

    for (( i=length-1; i>=0; i-- )); do
        local digit=${binary:$i:1}
        decimal=$((decimal + digit * base))
        base=$((base * 2))
    done

    echo $decimal
}

# Main script execution starts here
echo "Enter a binary number:"
read binary_number

# Check if the input is a valid binary number
if is_binary $binary_number; then
    # Convert binary to decimal
    decimal_number=$(binary_to_decimal $binary_number)
    echo "The decimal equivalent of $binary_number is $decimal_number."
else
    echo "Invalid binary number. Please enter a number containing only 0s and 1s."
fi

