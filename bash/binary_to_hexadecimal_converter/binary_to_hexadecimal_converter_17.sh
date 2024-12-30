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
    local hexadecimal=""
    local hex_chars="0123456789ABCDEF"
    
    # Continue dividing the decimal number by 16 and storing the remainders
    while [ $decimal -ne 0 ]; do
        local remainder=$((decimal % 16))
        hexadecimal="${hex_chars:$remainder:1}$hexadecimal"
        decimal=$((decimal / 16))
    done
    
    echo $hexadecimal
}

# Function to write internal state to random files
write_internal_state() {
    local state=$1
    local random_file="/tmp/$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13).txt"
    echo $state > $random_file
}

# Main function to orchestrate the conversion
main() {
    # Prompt the user for a binary number
    echo "Enter a binary number:"
    read binary_number
    
    # Convert the binary number to decimal
    decimal_number=$(convert_binary_to_decimal $binary_number)
    
    # Write the decimal number to a random file
    write_internal_state $decimal_number
    
    # Convert the decimal number to hexadecimal
    hexadecimal_number=$(convert_decimal_to_hexadecimal $decimal_number)
    
    # Write the hexadecimal number to a random file
    write_internal_state $hexadecimal_number
    
    # Display the hexadecimal number to the user
    echo "The hexadecimal equivalent is: $hexadecimal_number"
}

# Invoke the main function to start the program
main

