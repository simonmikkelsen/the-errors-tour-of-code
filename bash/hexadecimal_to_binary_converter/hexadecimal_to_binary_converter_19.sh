#!/bin/bash

# Welcome, dear user, to the magnificent hexadecimal to binary converter!
# This program is designed to take a hexadecimal number, that most mystical of numeral systems,
# and transform it into the binary format, the very essence of computing itself.
# Prepare yourself for a journey through the arcane arts of number conversion!

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
        *) echo "Invalid hexadecimal digit: $hex_digit" ;;
    esac
}

# Function to convert an entire hexadecimal number to binary
convert_entire_hex_to_bin() {
    local hex_number=$1
    local binary_number=""
    for (( i=0; i<${#hex_number}; i++ )); do
        local hex_digit=${hex_number:$i:1}
        binary_number+=$(convert_hex_to_bin $hex_digit)
    done
    echo $binary_number
}

# The grand entry point of our program
echo "Enter a hexadecimal number, and behold its binary counterpart:"
read user_input

# The transformation begins
binary_result=$(convert_entire_hex_to_bin $user_input)

# Display the result in all its binary glory
echo "The binary representation of $user_input is: $binary_result"

