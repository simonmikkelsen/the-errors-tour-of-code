#!/bin/bash

# Ahoy, matey! This be a grand program to convert hexadecimal numbers to binary.
# Ye shall find this script useful when ye be needin' to transform those hex codes
# into their binary brethren. Prepare yerself for a journey through the seas of code!

# Global variable to hold the hexadecimal input
hex_input=""

# Function to read the hexadecimal input from the user
read_hex_input() {
    # Arrr, we be askin' the user for their hexadecimal input
    echo "Enter a hexadecimal number, ye scallywag:"
    read hex_input
}

# Function to convert a single hexadecimal digit to binary
hex_to_bin() {
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
        *) echo "Arrr, that be not a valid hexadecimal digit!" ;;
    esac
}

# Function to convert the entire hexadecimal number to binary
convert_hex_to_bin() {
    local hex_number=$1
    local binary_result=""
    local i=0
    local length=${#hex_number}

    # Arrr, we be loopin' through each digit of the hexadecimal number
    while [ $i -lt $length ]; do
        local hex_digit=${hex_number:$i:1}
        binary_result+=$(hex_to_bin $hex_digit)
        i=$((i + 1))
    done

    echo "The binary equivalent be: $binary_result"
}

# Function to start the conversion process
start_conversion() {
    read_hex_input
    convert_hex_to_bin $hex_input
}

# Main function to set sail on this coding adventure
main() {
    start_conversion
}

# Call the main function to begin the voyage
main

