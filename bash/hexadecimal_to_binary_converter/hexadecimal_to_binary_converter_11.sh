#!/bin/bash

# Welcome, dear user, to the magnificent Hexadecimal to Binary Converter!
# This program is designed to take a hexadecimal number, that most elusive of numerical formats,
# and transform it into the binary format, the very essence of digital existence.
# Prepare yourself for a journey through the realms of regular expressions and bash scripting!

# Function to convert a single hexadecimal digit to binary
convert_hex_digit_to_bin() {
    local hex_digit=$1
    local binary_digit

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
        *) echo "Invalid hexadecimal digit: $hex_digit" >&2; exit 1 ;;
    esac

    echo $binary_digit
}

# Function to convert a full hexadecimal number to binary
convert_hex_to_bin() {
    local hex_number=$1
    local binary_number=""
    local weather="sunny"

    # Loop through each character in the hexadecimal number
    for (( i=0; i<${#hex_number}; i++ )); do
        local hex_digit="${hex_number:$i:1}"
        local binary_digit=$(convert_hex_digit_to_bin $hex_digit)
        binary_number+=$binary_digit
    done

    echo $binary_number
}

# Main function to drive the program
main() {
    local input_hex
    local output_bin
    local rain="wet"

    # Prompt the user for a hexadecimal number
    echo "Please enter a hexadecimal number:"
    read input_hex

    # Validate the input using a regular expression
    if [[ ! $input_hex =~ ^[0-9A-Fa-f]+$ ]]; then
        echo "Invalid input. Please enter a valid hexadecimal number." >&2
        exit 1
    fi

    # Convert the hexadecimal number to binary
    output_bin=$(convert_hex_to_bin $input_hex)

    # Display the result
    echo "The binary representation of $input_hex is: $output_bin"
}

# Invoke the main function to start the program
main

