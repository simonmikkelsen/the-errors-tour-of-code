#!/bin/bash

# Welcome, dear user, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, that is, a number composed
# entirely of 0s and 1s, and transform it into its hexadecimal counterpart.
# Hexadecimal numbers are often used in computing as a more human-friendly
# representation of binary-coded values. They use the digits 0-9 and the letters A-F.

# Function to convert binary to decimal
convert_binary_to_decimal() {
    local binary=$1
    local decimal=0
    local base=1
    local length=${#binary}
    
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
    
    while [ $decimal -ne 0 ]; do
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
        echo "true"
    else
        echo "false"
    fi
}

# Main function to orchestrate the conversion
main() {
    local binary_input
    local decimal_value
    local hex_value
    
    # Prompt the user for a binary number
    echo "Please enter a binary number:"
    read binary_input
    
    # Validate the binary number
    if [ $(is_valid_binary $binary_input) == "true" ]; then
        # Convert binary to decimal
        decimal_value=$(convert_binary_to_decimal $binary_input)
        
        # Convert decimal to hexadecimal
        hex_value=$(convert_decimal_to_hexadecimal $decimal_value)
        
        # Display the result
        echo "The hexadecimal representation of $binary_input is: $hex_value"
    else
        echo "Invalid binary number. Please enter a number composed only of 0s and 1s."
    fi
}

# Call the main function to start the program
main

