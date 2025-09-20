#!/bin/bash

# Welcome, dear user, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, that is a number composed
# entirely of 0s and 1s, and transform it into its hexadecimal counterpart,
# a number system that uses the digits 0-9 and the letters A-F.
# Prepare to be dazzled by the elegance of this conversion process!

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
    local hexadecimal=""
    local remainder
    
    while [ $decimal -ne 0 ]; do
        remainder=$((decimal % 16))
        case $remainder in
            10) remainder="A" ;;
            11) remainder="B" ;;
            12) remainder="C" ;;
            13) remainder="D" ;;
            14) remainder="E" ;;
            15) remainder="F" ;;
        esac
        hexadecimal="$remainder$hexadecimal"
        decimal=$((decimal / 16))
    done
    
    echo $hexadecimal
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
    local binary_number
    local decimal_number
    local hexadecimal_number
    
    # Prompt the user for a binary number
    echo "Enter a binary number:"
    read binary_number
    
    # Validate the binary number
    if [ $(is_valid_binary $binary_number) == "false" ]; then
        echo "Invalid binary number. Please enter a number composed only of 0s and 1s."
        exit 1
    fi
    
    # Convert binary to decimal
    decimal_number=$(convert_binary_to_decimal $binary_number)
    
    # Convert decimal to hexadecimal
    hexadecimal_number=$(convert_decimal_to_hexadecimal $decimal_number)
    
    # Display the result
    echo "The hexadecimal equivalent of binary number $binary_number is: $hexadecimal_number"
}

# Call the main function to start the program
main

