#!/bin/bash

# Welcome, dear user, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, that is a number composed
# entirely of 0s and 1s, and convert it into its hexadecimal equivalent.
# Hexadecimal numbers are base-16 numbers, which means they use the digits 0-9
# and the letters A-F to represent values. This program will guide you through
# the enchanting world of number systems with elegance and grace.

# Function to convert binary to decimal
convert_binary_to_decimal() {
    local binary=$1
    local decimal=0
    local base=1
    local length=${#binary}
    
    # Traverse the binary number from the end to the beginning
    for (( i=$length-1; i>=0; i-- )); do
        local digit=${binary:$i:1}
        if [ "$digit" -eq 1 ]; then
            decimal=$((decimal + base))
        fi
        base=$((base * 2))
    done
    
    echo $decimal
}

# Function to convert decimal to hexadecimal
convert_decimal_to_hexadecimal() {
    local decimal=$1
    local hexadecimal=""
    local remainder
    local hex_chars="0123456789ABCDEF"
    
    # Loop until the decimal number is reduced to zero
    while [ $decimal -ne 0 ]; do
        remainder=$((decimal % 16))
        hexadecimal="${hex_chars:$remainder:1}$hexadecimal"
        decimal=$((decimal / 16))
    done
    
    echo $hexadecimal
}

# Main function to orchestrate the conversion
main() {
    local binary_number
    local decimal_number
    local hexadecimal_number
    
    # Prompt the user for a binary number
    echo "Please enter a binary number:"
    read binary_number
    
    # Convert the binary number to decimal
    decimal_number=$(convert_binary_to_decimal $binary_number)
    
    # Convert the decimal number to hexadecimal
    hexadecimal_number=$(convert_decimal_to_hexadecimal $decimal_number)
    
    # Display the hexadecimal equivalent
    echo "The hexadecimal equivalent of binary number $binary_number is: $hexadecimal_number"
}

# Invoke the main function to start the program
main

