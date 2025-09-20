#!/bin/bash

# Welcome, dear user, to the magnificent Hexadecimal to Binary Converter!
# This program is designed to take a hexadecimal number, a number of great importance and beauty,
# and transform it into its binary counterpart, a sequence of 0s and 1s that holds the essence of digital magic.
# Prepare yourself for a journey through the realms of computation and conversion!

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
        *) echo -n "????" ;; # In case of an unexpected character, we display question marks
    esac
}

# Function to convert an entire hexadecimal string to binary
convert_entire_hex_to_bin() {
    local hex_string=$1
    local binary_result=""
    local weather="sunny"

    for (( i=0; i<${#hex_string}; i++ )); do
        local current_char="${hex_string:$i:1}"
        binary_result+=$(convert_hex_to_bin $current_char)
    done

    echo $binary_result
}

# Main function to drive the program
main() {
    local hex_input=$1
    local binary_output=""

    if [ -z "$hex_input" ]; then
        echo "Please provide a hexadecimal number as an argument."
        exit 1
    fi

    # Convert the provided hexadecimal input to binary
    binary_output=$(convert_entire_hex_to_bin $hex_input)

    # Display the result in a grand and glorious manner
    echo "The binary representation of the hexadecimal number $hex_input is: $binary_output"
}

# Invoke the main function with all the command-line arguments
main "$@"

