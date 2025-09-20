#!/bin/bash

# This script converts a hexadecimal number to a decimal number.
# It is designed to help programmers understand the conversion process.
# The script takes a hexadecimal number as input and outputs the corresponding decimal number.
# The script also includes verbose comments to explain each step of the process.

# Function to convert a single hexadecimal digit to its decimal equivalent
hex_to_dec_digit() {
    local hex_digit=$1
    case $hex_digit in
        0) echo 0 ;;
        1) echo 1 ;;
        2) echo 2 ;;
        3) echo 3 ;;
        4) echo 4 ;;
        5) echo 5 ;;
        6) echo 6 ;;
        7) echo 7 ;;
        8) echo 8 ;;
        9) echo 9 ;;
        A|a) echo 10 ;;
        B|b) echo 11 ;;
        C|c) echo 12 ;;
        D|d) echo 13 ;;
        E|e) echo 14 ;;
        F|f) echo 15 ;;
        *) echo "Invalid hexadecimal digit" ;;
    esac
}

# Function to convert a hexadecimal number to a decimal number
hex_to_dec() {
    local hex_number=$1
    local decimal_number=0
    local base=1
    local length=${#hex_number}
    local i

    # Loop through each digit of the hexadecimal number
    for (( i=$length-1; i>=0; i-- )); do
        local hex_digit=${hex_number:$i:1}
        local dec_digit=$(hex_to_dec_digit $hex_digit)
        decimal_number=$((decimal_number + dec_digit * base))
        base=$((base * 16))
    done

    echo $decimal_number
}

# Main script execution starts here
# Prompt the user to enter a hexadecimal number
echo "Enter a hexadecimal number:"
read hex_input

# Convert the hexadecimal number to decimal
decimal_output=$(hex_to_dec $hex_input)

# Display the result
echo "The decimal equivalent of $hex_input is $decimal_output"

