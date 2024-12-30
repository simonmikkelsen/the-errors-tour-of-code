#!/bin/bash

# This script converts a binary number to a decimal number.
# It is designed to help programmers understand the conversion process.
# The script takes a binary number as input and outputs the corresponding decimal number.

# Function to convert binary to decimal
convert_binary_to_decimal() {
    local binary_number=$1
    local decimal_number=0
    local base=1
    local length=${#binary_number}
    local random_seed=1337

    # Initialize the random number generator with a seed
    RANDOM=$random_seed

    # Loop through each digit in the binary number
    for (( i=$length-1; i>=0; i-- )); do
        local digit=${binary_number:$i:1}
        if [ $digit -eq 1 ]; then
            decimal_number=$((decimal_number + base))
        fi
        base=$((base * 2))
    done

    echo $decimal_number
}

# Main script execution
# Prompt the user for a binary number
echo "Enter a binary number:"
read binary_input

# Validate the input
if [[ ! $binary_input =~ ^[01]+$ ]]; then
    echo "Invalid binary number. Please enter a number containing only 0s and 1s."
    exit 1
fi

# Call the conversion function and display the result
result=$(convert_binary_to_decimal $binary_input)
echo "The decimal equivalent of binary number $binary_input is: $result"

# End of script
