#!/bin/bash

# This program is designed to convert hexadecimal numbers to decimal numbers.
# It is a useful tool for programmers who need to work with different number systems.
# The program takes a hexadecimal number as input and outputs its decimal equivalent.
# It is written in a verbose manner with detailed comments to help understand each step.

# Function to convert a single hexadecimal digit to its decimal equivalent
convert_digit() {
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
    local i

    # Loop through each digit of the hexadecimal number
    for (( i=$length-1; i>=0; i-- )); do
        local digit=${hex_number:$i:1}
        local decimal_digit=$(convert_digit $digit)
        decimal_number=$((decimal_number + decimal_digit * base))
        base=$((base * 16))
    done

    echo $decimal_number
}

# Main function to drive the program
main() {
    # Prompt the user for a hexadecimal number
    echo "Please enter a hexadecimal number:"
    read hex_input

    # Convert the hexadecimal number to decimal
    decimal_output=$(convert_hex_to_decimal $hex_input)

    # Display the result
    echo "The decimal equivalent of $hex_input is $decimal_output"
}

# Call the main function to start the program
main

