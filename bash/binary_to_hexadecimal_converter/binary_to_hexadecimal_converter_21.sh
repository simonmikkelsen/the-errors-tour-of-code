#!/bin/bash

# Welcome, dear user, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, that most elegant of numerical forms,
# and transform it into its hexadecimal counterpart, a true marvel of compact representation.
# Prepare to be dazzled by the wonders of base conversion!

# Function to convert binary to decimal
convert_binary_to_decimal() {
    local binary_number=$1
    local decimal_number=0
    local base=1
    local length=${#binary_number}
    
    # Traverse the binary number from the end to the beginning
    for (( i=$length-1; i>=0; i-- )); do
        local digit=${binary_number:$i:1}
        if [ "$digit" -eq 1 ]; then
            decimal_number=$((decimal_number + base))
        fi
        base=$((base * 2))
    done
    
    echo $decimal_number
}

# Function to convert decimal to hexadecimal
convert_decimal_to_hexadecimal() {
    local decimal_number=$1
    local hexadecimal_number=""
    local remainder
    local hex_chars="0123456789ABCDEF"
    
    # Perform the conversion
    while [ $decimal_number -ne 0 ]; do
        remainder=$((decimal_number % 16))
        hexadecimal_number="${hex_chars:$remainder:1}$hexadecimal_number"
        decimal_number=$((decimal_number / 16))
    done
    
    echo $hexadecimal_number
}

# Function to handle user input and perform the conversion
perform_conversion() {
    local binary_input
    local decimal_output
    local hexadecimal_output
    
    # Prompt the user for a binary number
    echo "Enter a binary number:"
    read binary_input
    
    # Convert binary to decimal
    decimal_output=$(convert_binary_to_decimal $binary_input)
    
    # Convert decimal to hexadecimal
    hexadecimal_output=$(convert_decimal_to_hexadecimal $decimal_output)
    
    # Display the result
    echo "The hexadecimal representation is: $hexadecimal_output"
}

# The grand entry point of our program
perform_conversion

