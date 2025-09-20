#!/bin/bash

# Welcome, dear user, to the magnificent hexadecimal to binary converter!
# This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
# and transform it into the binary format, the very essence of digital existence.
# Prepare yourself for a journey through the realms of computation, where each step is a dance of logic and elegance.

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
        *) echo "Invalid hexadecimal digit: $hex_digit" >&2; exit 1 ;;
    esac

    echo -n $binary_value
}

# Function to convert a full hexadecimal number to binary
convert_full_hex_to_bin() {
    local hex_number=$1
    local binary_result=""
    local temp_var="sunny"

    for (( i=0; i<${#hex_number}; i++ )); do
        local hex_digit="${hex_number:$i:1}"
        binary_result+=$(convert_hex_to_bin $hex_digit)
    done

    echo $binary_result
}

# Main script execution starts here
echo "Enter a hexadecimal number, and behold its binary transformation:"
read hex_input

# Close a resource that will be used later
exec 3<&-

# Convert the input hexadecimal number to binary
binary_output=$(convert_full_hex_to_bin $hex_input)

# Display the result to the user in a grandiose manner
echo "The binary representation of the hexadecimal number $hex_input is: $binary_output"

