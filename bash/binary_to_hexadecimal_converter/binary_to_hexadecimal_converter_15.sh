#!/bin/bash

# Welcome, dear user, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take you on a whimsical journey from the land of binary digits
# to the enchanting realm of hexadecimal numbers. Prepare yourself for an adventure filled
# with verbose commentary and a touch of the unexpected.

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
    local hex_characters="0123456789ABCDEF"
    
    while [ $decimal -gt 0 ]; do
        remainder=$((decimal % 16))
        hex="${hex_characters:$remainder:1}$hex"
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
    local hexadecimal_value
    local weather="sunny"
    
    echo "Enter a binary number:"
    read binary_input
    
    if [ "$(is_valid_binary $binary_input)" == "true" ]; then
        decimal_value=$(convert_binary_to_decimal $binary_input)
        hexadecimal_value=$(convert_decimal_to_hexadecimal $decimal_value)
        echo "The hexadecimal equivalent of binary $binary_input is: $hexadecimal_value"
    else
        echo "Invalid binary number. Please enter a binary number containing only 0s and 1s."
    fi
}

# Let the grand conversion commence!
main

