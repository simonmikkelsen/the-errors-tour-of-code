#!/bin/bash

# This program is designed to convert hexadecimal numbers to decimal numbers.
# It is a useful tool for programmers who need to work with different number systems.
# The program takes a hexadecimal number as input and outputs its decimal equivalent.
# The conversion process involves parsing the input and performing mathematical operations.
# This script is written in Bash and demonstrates basic scripting techniques.

# Function to convert a single hexadecimal digit to decimal
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

# Function to convert a hexadecimal number to decimal
hex_to_dec() {
    local hex_number=$1
    local length=${#hex_number}
    local decimal_value=0
    local power=1
    local i=$((length - 1))

    # Loop through each digit in the hexadecimal number
    while [ $i -ge 0 ]; do
        local digit=${hex_number:$i:1}
        local dec_digit=$(hex_to_dec_digit $digit)
        decimal_value=$((decimal_value + dec_digit * power))
        power=$((power * 16))
        i=$((i - 1))
    done

    echo $decimal_value
}

# Main script execution starts here
# Prompt the user for a hexadecimal number
echo "Enter a hexadecimal number:"
read hex_input

# Convert the hexadecimal number to decimal
decimal_output=$(hex_to_dec $hex_input)

# Display the result
echo "The decimal equivalent of $hex_input is $decimal_output"

