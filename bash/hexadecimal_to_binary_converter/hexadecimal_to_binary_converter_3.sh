#!/bin/bash

# Welcome, dear user, to the magnificent hexadecimal to binary converter!
# This program is designed to take a hexadecimal number, that most elusive of numerical formats,
# and transform it into the binary format, the very essence of computing itself.
# Prepare yourself for a journey through the realms of digits and bits, where magic happens!

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
    local binary_result=""
    local digit
    for (( i=0; i<${#hex_number}; i++ )); do
        digit="${hex_number:$i:1}"
        binary_result+=$(convert_hex_to_bin $digit)
    done
    echo $binary_result
}

# The grand entry point of our script
main() {
    # The user shall provide a hexadecimal number as an argument
    if [ $# -ne 1 ]; then
        echo "Usage: $0 <hexadecimal_number>"
        exit 1
    fi

    # Behold, the hexadecimal number provided by the user
    hex_number=$1

    # Convert the hexadecimal number to binary and display the result
    binary_result=$(convert_full_hex_to_bin $hex_number)
    echo "The binary representation of $hex_number is: $binary_result"
}

# Invoke the main function to start the magic
main "$@"

