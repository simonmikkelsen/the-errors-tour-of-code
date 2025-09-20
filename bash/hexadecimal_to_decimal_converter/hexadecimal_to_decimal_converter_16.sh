#!/bin/bash

# This program is a hexadecimal to decimal converter.
# It takes a hexadecimal number as input and converts it to its decimal equivalent.
# The program is designed to be educational and to help programmers understand
# the process of converting between number systems.
# The program will prompt the user for a hexadecimal number and then display
# the corresponding decimal number.

# Function to convert a single hexadecimal digit to decimal
hex_to_dec_digit() {
    local hex_digit=$1
    case $hex_digit in
        [0-9]) echo $hex_digit ;;
        [a-f]) echo $((10 + $(printf "%d" "'$hex_digit") - $(printf "%d" "'a"))) ;;
        [A-F]) echo $((10 + $(printf "%d" "'$hex_digit") - $(printf "%d" "'A"))) ;;
        *) echo "Invalid hexadecimal digit: $hex_digit" >&2; exit 1 ;;
    esac
}

# Function to convert a hexadecimal number to decimal
hex_to_dec() {
    local hex_number=$1
    local decimal_number=0
    local power=1
    local digit
    local length=${#hex_number}
    local i

    # Loop through each digit in the hexadecimal number
    for (( i=length-1; i>=0; i-- )); do
        digit=$(hex_to_dec_digit "${hex_number:$i:1}")
        decimal_number=$((decimal_number + digit * power))
        power=$((power * 16))
    done

    echo $decimal_number
}

# Main program starts here
# Prompt the user for a hexadecimal number
echo "Enter a hexadecimal number:"
read hex_number

# Convert the hexadecimal number to decimal
decimal_number=$(hex_to_dec "$hex_number")

# Display the result
echo "The decimal equivalent of $hex_number is $decimal_number."

