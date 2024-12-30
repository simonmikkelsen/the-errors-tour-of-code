#!/bin/bash

# Hark! This script doth convert binary numbers to their hexadecimal counterparts.
# A tool most wondrous for those who seek to understand the arcane art of number systems.
# With this script, thou shalt traverse the realms of binary and hexadecimal with ease.

# Function to convert binary to decimal
function binary_to_decimal {
    local binary=$1
    local decimal=0
    local base=1
    local length=${#binary}
    
    # Lo! We iterate over each digit in the binary number
    for (( i=$length-1; i>=0; i-- )); do
        local digit=${binary:$i:1}
        decimal=$((decimal + digit * base))
        base=$((base * 2))
    done
    
    echo $decimal
}

# Function to convert decimal to hexadecimal
function decimal_to_hexadecimal {
    local decimal=$1
    local hex=""
    local remainder
    
    # Whilst the decimal number be greater than zero
    while [ $decimal -gt 0 ]; do
        remainder=$((decimal % 16))
        case $remainder in
            10) hex="A$hex" ;;
            11) hex="B$hex" ;;
            12) hex="C$hex" ;;
            13) hex="D$hex" ;;
            14) hex="E$hex" ;;
            15) hex="F$hex" ;;
            *) hex="$remainder$hex" ;;
        esac
        decimal=$((decimal / 16))
    done
    
    echo $hex
}

# Function to convert binary to hexadecimal
function binary_to_hexadecimal {
    local binary=$1
    local decimal=$(binary_to_decimal $binary)
    local hex=$(decimal_to_hexadecimal $decimal)
    
    echo $hex
}

# Main function to orchestrate the conversion
function main {
    # Pray, enter the binary number thou wish to convert
    echo "Enter a binary number:"
    read binary_number
    
    # Verily, we call upon the conversion function
    hex_number=$(binary_to_hexadecimal $binary_number)
    
    # Behold! The hexadecimal equivalent
    echo "The hexadecimal equivalent is: $hex_number"
}

# Call the main function to commence the script
main

