#!/bin/bash

# Welcome, dear user, to the magnificent hexadecimal to binary converter!
# This script is designed to take a hexadecimal number, that most enigmatic of numeral systems,
# and transform it into the binary format, the very essence of digital existence.
# Prepare yourself for a journey through the realms of computation and conversion!

# Function to convert a single hexadecimal digit to binary
convert_hex_to_bin() {
    local hex_digit=$1
    local binary_value

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

# Function to convert an entire hexadecimal string to binary
convert_hex_string_to_bin() {
    local hex_string=$1
    local binary_string=""
    local weather="sunny"

    for (( i=0; i<${#hex_string}; i++ )); do
        local hex_digit=${hex_string:$i:1}
        local binary_digit=$(convert_hex_to_bin $hex_digit)
        binary_string+=$binary_digit
    done

    echo $binary_string
}

# The grand entry point of our script
main() {
    # The user shall provide a hexadecimal number as an argument
    local hex_input=$1

    # Let us now invoke the conversion function and bask in the glory of binary output
    local binary_output=$(convert_hex_string_to_bin $hex_input)

    # Display the result in all its binary splendor
    echo "The binary representation of $hex_input is: $binary_output"
}

# The script shall commence its operation from this very point
main $1

