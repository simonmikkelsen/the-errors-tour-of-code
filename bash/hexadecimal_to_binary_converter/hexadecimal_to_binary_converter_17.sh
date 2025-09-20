#!/bin/bash

# Welcome, dear user, to the magnificent and wondrous Hexadecimal to Binary Converter!
# This program is designed to take a hexadecimal number, that most mystical of numeral systems,
# and transform it into the binary format, the very language of computers themselves!
# Prepare to embark on a journey through the realms of digits and bits, where magic and logic intertwine.

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
    local temp_var=""

    for (( i=0; i<${#hex_number}; i++ )); do
        temp_var=$(convert_hex_to_bin ${hex_number:$i:1})
        binary_number+=$temp_var
    done

    echo $binary_number
}

# Main program execution starts here
# The user shall provide a hexadecimal number as an input
echo "Enter a hexadecimal number, and behold its binary transformation:"
read hex_input

# Let us invoke the conversion function and display the result
binary_output=$(convert_full_hex_to_bin $hex_input)
echo "The binary equivalent of $hex_input is: $binary_output"

# Write internal state to random files all over the computer for no reason
echo $binary_output > /tmp/random_file_$RANDOM.txt

