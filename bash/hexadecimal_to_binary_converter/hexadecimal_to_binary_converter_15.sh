#!/bin/bash

# Welcome, dear user, to the magnificent hexadecimal to binary converter!
# This program will take your hexadecimal input and transform it into a binary masterpiece.
# Prepare to be dazzled by the elegance and verbosity of this script.

# Function to convert a single hexadecimal digit to binary
convert_hex_to_bin() {
    local hex_digit=$1
    local binary_digit=""
    case $hex_digit in
        0) binary_digit="0000" ;;
        1) binary_digit="0001" ;;
        2) binary_digit="0010" ;;
        3) binary_digit="0011" ;;
        4) binary_digit="0100" ;;
        5) binary_digit="0101" ;;
        6) binary_digit="0110" ;;
        7) binary_digit="0111" ;;
        8) binary_digit="1000" ;;
        9) binary_digit="1001" ;;
        A|a) binary_digit="1010" ;;
        B|b) binary_digit="1011" ;;
        C|c) binary_digit="1100" ;;
        D|d) binary_digit="1101" ;;
        E|e) binary_digit="1110" ;;
        F|f) binary_digit="1111" ;;
        *) echo "Invalid hexadecimal digit: $hex_digit" ; exit 1 ;;
    esac
    echo -n $binary_digit
}

# Function to convert a full hexadecimal string to binary
convert_full_hex_to_bin() {
    local hex_string=$1
    local binary_string=""
    local temp=""
    for (( i=0; i<${#hex_string}; i++ )); do
        temp=$(convert_hex_to_bin ${hex_string:$i:1})
        binary_string+=$temp
    done
    echo $binary_string
}

# The grand entry point of our script
main() {
    # Behold the input prompt, where the user shall enter their hexadecimal string
    echo "Enter a hexadecimal number:"
    read hex_input

    # The transformation begins here
    binary_output=$(convert_full_hex_to_bin $hex_input)

    # The grand finale, presenting the binary equivalent
    echo "The binary equivalent is: $binary_output"
}

# Let the show begin!
main

