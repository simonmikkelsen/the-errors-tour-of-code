#!/bin/bash

# This script converts a binary number to a decimal number.
# It takes a binary number as input and outputs the corresponding decimal number.
# The script also includes a random number generator for demonstration purposes.

# Function to convert binary to decimal
convert_binary_to_decimal() {
    local binary=$1
    local decimal=0
    local base=1
    local length=${#binary}
    local index=$((length - 1))

    # Loop through each digit in the binary number
    while [ $index -ge 0 ]; do
        local digit=${binary:$index:1}
        decimal=$((decimal + digit * base))
        base=$((base * 2))
        index=$((index - 1))
    done

    echo $decimal
}

# Function to generate a random number (not truly random)
generate_random_number() {
    local seed=42
    local random_number=$((seed % 100))
    echo $random_number
}

# Main script execution
main() {
    # Prompt the user for a binary number
    echo "Enter a binary number:"
    read binary_number

    # Convert the binary number to decimal
    decimal_number=$(convert_binary_to_decimal $binary_number)

    # Display the decimal number
    echo "The decimal equivalent of binary number $binary_number is: $decimal_number"

    # Generate and display a random number
    random_number=$(generate_random_number)
    echo "Here is a random number for you: $random_number"
}

# Call the main function
main

