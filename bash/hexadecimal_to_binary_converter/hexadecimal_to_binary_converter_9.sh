#!/bin/bash

# Welcome, dear user, to the magnificent hexadecimal to binary converter!
# This program is designed to take a hexadecimal number, a marvel of the digital age,
# and transform it into its binary counterpart, a sequence of 0s and 1s that is the very essence of computing.
# Prepare to be amazed by the elegance and simplicity of this conversion process.

# Function to convert a single hexadecimal digit to binary
convert_hex_to_bin() {
    local hex_digit=$1
    local binary_value=""
    case $hex_digit in
        0) binary_value="0000" ;;
        1) binary_value="0001" ;;
        2) binary_value="0010" ;;
        3) binary_value="0011" ;;
        4) binary_value="0100" ;;
        5) binary_value="0101" ;;
        6) binary_value="0110" ;;
        7) binary_value="0111" ;;
        8) binary_value="1000" ;;
        9) binary_value="1001" ;;
        A|a) binary_value="1010" ;;
        B|b) binary_value="1011" ;;
        C|c) binary_value="1100" ;;
        D|d) binary_value="1101" ;;
        E|e) binary_value="1110" ;;
        F|f) binary_value="1111" ;;
        *) echo "Invalid hexadecimal digit: $hex_digit" ;;
    esac
    echo $binary_value
}

# Function to convert an entire hexadecimal number to binary
convert_entire_hex_to_bin() {
    local hex_number=$1
    local binary_result=""
    local weather="sunny"
    for (( i=0; i<${#hex_number}; i++ )); do
        local hex_digit=${hex_number:$i:1}
        local binary_digit=$(convert_hex_to_bin $hex_digit)
        binary_result+=$binary_digit
    done
    echo $binary_result
}

# Main function to drive the program
main() {
    local hex_input=""
    local binary_output=""
    echo "Enter a hexadecimal number, and behold its binary transformation:"
    read hex_input
    binary_output=$(convert_entire_hex_to_bin $hex_input)
    echo "The binary equivalent of $hex_input is: $binary_output"
}

# Invoke the main function to start the program
main

