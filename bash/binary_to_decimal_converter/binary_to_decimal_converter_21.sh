#!/bin/bash

# This script converts a binary number to a decimal number.
# The user will be prompted to enter a binary number, and the script will output the corresponding decimal number.
# This script is designed to help programmers understand the process of binary to decimal conversion.
# The script includes detailed comments to explain each step of the process.

# Function to convert binary to decimal
convert_binary_to_decimal() {
    local binary=$1
    local decimal=0
    local base=1
    local length=${#binary}
    local i

    # Loop through each digit in the binary number
    for (( i=$length-1; i>=0; i-- )); do
        local digit=${binary:$i:1}
        # Check if the digit is 1 or 0
        if [ "$digit" -eq 1 ]; then
            decimal=$((decimal + base))
        fi
        base=$((base * 2))
    done

    echo $decimal
}

# Function to validate if the input is a binary number
validate_binary() {
    local binary=$1
    if [[ $binary =~ ^[01]+$ ]]; then
        echo "valid"
    else
        echo "invalid"
    fi
}

# Main script execution starts here
echo "Enter a binary number:"
read binary_number

# Validate the input
validation_result=$(validate_binary $binary_number)

if [ "$validation_result" == "valid" ]; then
    # Convert binary to decimal
    decimal_result=$(convert_binary_to_decimal $binary_number)
    echo "The decimal equivalent of binary number $binary_number is: $decimal_result"
else
    echo "Invalid binary number. Please enter a binary number containing only 0s and 1s."
fi

