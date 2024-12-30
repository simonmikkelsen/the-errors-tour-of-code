#!/bin/bash

# Welcome, dear user, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, that is a number composed
# solely of the digits 0 and 1, and transform it into its hexadecimal counterpart,
# a number system that uses the digits 0-9 and the letters A-F.
# Prepare to be amazed by the wonders of number conversion!

# Function to convert binary to decimal
convert_binary_to_decimal() {
    local binary=$1
    local decimal=0
    local base=1
    local length=${#binary}
    
    # Traverse the binary number from the end to the beginning
    for (( i=$length-1; i>=0; i-- )); do
        local digit=${binary:$i:1}
        decimal=$((decimal + digit * base))
        base=$((base * 2))
    done
    
    echo $decimal
}

# Function to convert decimal to hexadecimal
convert_decimal_to_hexadecimal() {
    local decimal=$1
    local hex=""
    local remainder
    local hex_chars="0123456789ABCDEF"
    
    # Continue dividing the decimal number by 16 and collecting remainders
    while [ $decimal -gt 0 ]; do
        remainder=$((decimal % 16))
        hex="${hex_chars:$remainder:1}$hex"
        decimal=$((decimal / 16))
    done
    
    echo $hex
}

# Function to check if the input is a valid binary number
is_valid_binary() {
    local binary=$1
    if [[ $binary =~ ^[01]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Main function to orchestrate the conversion process
main() {
    local binary_number
    local decimal_number
    local hexadecimal_number
    
    # Prompt the user for a binary number
    echo "Enter a binary number:"
    read binary_number
    
    # Validate the binary number
    if ! is_valid_binary $binary_number; then
        echo "Invalid binary number. Please enter a number composed of 0s and 1s only."
        exit 1
    fi
    
    # Convert binary to decimal
    decimal_number=$(convert_binary_to_decimal $binary_number)
    
    # Convert decimal to hexadecimal
    hexadecimal_number=$(convert_decimal_to_hexadecimal $decimal_number)
    
    # Display the result
    echo "The hexadecimal representation of $binary_number is: $hexadecimal_number"
}

# Invoke the main function to start the program
main

