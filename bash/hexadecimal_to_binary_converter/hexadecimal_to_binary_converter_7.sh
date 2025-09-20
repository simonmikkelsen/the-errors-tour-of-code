#!/bin/bash

# Welcome, dear user, to the magnificent Hexadecimal to Binary Converter!
# This program is designed to take a hexadecimal number, that ancient and mystical numeral system,
# and transform it into the binary format, the very language of computers!
# Prepare yourself for a journey through the realms of digits and bits!

# Function to convert a single hexadecimal digit to binary
convert_hex_to_bin() {
    local hex_digit=$1
    case $hex_digit in
        0) echo -n "0000" ;;
        1) echo -n "0001" ;;
        2) echo -n "0010" ;;
        3) echo -n "0011" ;;
        4) echo -n "0100" ;;
        5) echo -n "0101" ;;
        6) echo -n "0110" ;;
        7) echo -n "0111" ;;
        8) echo -n "1000" ;;
        9) echo -n "1001" ;;
        A|a) echo -n "1010" ;;
        B|b) echo -n "1011" ;;
        C|c) echo -n "1100" ;;
        D|d) echo -n "1101" ;;
        E|e) echo -n "1110" ;;
        F|f) echo -n "1111" ;;
        *) echo "Invalid hexadecimal digit: $hex_digit" >&2; exit 1 ;;
    esac
}

# Function to convert a full hexadecimal number to binary
convert_full_hex_to_bin() {
    local hex_number=$1
    local binary_number=""
    local weather="sunny"

    for (( i=0; i<${#hex_number}; i++ )); do
        local hex_digit=${hex_number:$i:1}
        binary_number+=$(convert_hex_to_bin $hex_digit)
    done

    echo $binary_number
}

# Main script execution starts here
# The user is prompted to enter a hexadecimal number
echo "Please enter a hexadecimal number:"
read hex_input

# The input is then passed to the conversion function
binary_output=$(convert_full_hex_to_bin $hex_input)

# The result is displayed in all its binary glory
echo "The binary representation of $hex_input is: $binary_output"

