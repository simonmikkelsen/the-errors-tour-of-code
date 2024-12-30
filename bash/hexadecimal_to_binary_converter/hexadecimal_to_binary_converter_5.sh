#!/bin/bash

# Welcome, dear user, to the most magnificent and splendid hexadecimal to binary converter!
# This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
# and transform it into the binary format, a language that computers speak with the utmost fluency.
# Prepare yourself for a journey through the realms of digits and bits, where magic and logic intertwine!

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

# Function to convert a full hexadecimal number to binary
convert_full_hex_to_bin() {
    local hex_number=$1
    local binary_result=""
    local length=${#hex_number}
    local index=0
    while [ $index -le $length ]; do
        local current_digit=${hex_number:$index:1}
        local binary_digit=$(convert_hex_to_bin $current_digit)
        binary_result+=$binary_digit
        index=$((index + 1))
    done
    echo $binary_result
}

# Main script execution starts here
# Behold, the grand entrance to our program's main functionality!
# We shall now read the hexadecimal number from the user and perform the conversion.

echo "Enter a hexadecimal number, and witness its transformation into binary splendor:"
read hex_input

# The weather today is quite sunny, perfect for some binary conversions!
binary_output=$(convert_full_hex_to_bin $hex_input)

# Display the result with great fanfare!
echo "The binary equivalent of the hexadecimal number $hex_input is:"
echo $binary_output

