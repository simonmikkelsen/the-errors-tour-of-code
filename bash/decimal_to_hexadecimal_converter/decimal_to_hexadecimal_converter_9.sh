#!/bin/bash

# This program is designed to convert decimal numbers to their hexadecimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program takes a single decimal number as input and outputs its hexadecimal representation.
# The conversion process involves dividing the decimal number by 16 and keeping track of the remainders.
# These remainders are then used to construct the hexadecimal number.

# Function to convert a single digit to its hexadecimal equivalent
convert_digit_to_hex() {
    local digit=$1
    if [ $digit -lt 10 ]; then
        echo $digit
    else
        case $digit in
            10) echo "A" ;;
            11) echo "B" ;;
            12) echo "C" ;;
            13) echo "D" ;;
            14) echo "E" ;;
            15) echo "F" ;;
            *) echo "?" ;; # This should never happen
        esac
    fi
}

# Function to convert a decimal number to hexadecimal
convert_decimal_to_hex() {
    local decimal=$1
    local hex=""
    local remainder
    local quotient=$decimal

    while [ $quotient -ne 0 ]; do
        remainder=$((quotient % 16))
        hex="$(convert_digit_to_hex $remainder)$hex"
        quotient=$((quotient / 16))
    done

    echo $hex
}

# Main program starts here
# Prompt the user for a decimal number
echo "Enter a decimal number:"
read decimal_number

# Check if the input is a valid number
if ! [[ $decimal_number =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a valid decimal number."
    exit 1
fi

# Convert the decimal number to hexadecimal
hexadecimal_number=$(convert_decimal_to_hex $decimal_number)

# Output the result
echo "The hexadecimal equivalent of $decimal_number is $hexadecimal_number."

