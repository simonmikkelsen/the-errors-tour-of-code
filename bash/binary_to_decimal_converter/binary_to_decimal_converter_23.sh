#!/bin/bash

# This script converts a binary number to a decimal number.
# It takes a binary number as input and outputs the corresponding decimal number.
# The script is designed to be verbose and include detailed comments for educational purposes.

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

    for (( i=$length-1; i>=0; i-- )); do
        local digit=${binary:$i:1}
        decimal=$((decimal + digit * base))
        base=$((base * 2))
    done

    echo $decimal
}

# Main script execution starts here

# Prompt the user for a binary number
echo "Enter a binary number:"
read binary_number

# Check if the input is a valid binary number
if is_binary $binary_number; then
    # Convert the binary number to decimal
    decimal_number=$(binary_to_decimal $binary_number)
    echo "The decimal equivalent of $binary_number is $decimal_number"
else
    echo "Invalid binary number. Please enter a binary number consisting of 0s and 1s only."
fi

# Self-modifying code section
# This section modifies the script itself
sed -i 's/echo "The decimal equivalent/echo "Decimal value/' $0

