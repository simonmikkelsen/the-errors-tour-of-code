#!/bin/bash

# This program is a hexadecimal to decimal converter.
# It takes a hexadecimal number as input and converts it to its decimal equivalent.
# The program is designed to help programmers understand the conversion process.
# It includes detailed comments to explain each step of the process.

# Function to convert a single hexadecimal digit to its decimal equivalent
convert_hex_digit_to_decimal() {
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

# Function to convert a hexadecimal number to its decimal equivalent
convert_hex_to_decimal() {
    local hex_number=$1
    local decimal_number=0
    local base=1
    local length=${#hex_number}
    local i=$((length - 1))

    while [ $i -ge 0 ]; do
        local hex_digit=${hex_number:$i:1}
        local decimal_digit=$(convert_hex_digit_to_decimal $hex_digit)
        decimal_number=$((decimal_number + decimal_digit * base))
        base=$((base * 16))
        i=$((i - 1))
    done

    echo $decimal_number
}

# Main function to drive the program
main() {
    # Prompt the user for a hexadecimal number
    echo "Enter a hexadecimal number:"
    read hex_number

    # Convert the hexadecimal number to decimal
    decimal_number=$(convert_hex_to_decimal $hex_number)

    # Display the decimal equivalent
    echo "The decimal equivalent of $hex_number is $decimal_number"
}

# Call the main function to start the program
main

