#!/bin/bash

# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program takes a decimal number as input and outputs the corresponding hexadecimal number.
# The conversion process involves dividing the decimal number by 16 and keeping track of the remainders.
# These remainders are then used to construct the hexadecimal number.

# Function to convert a single digit to its hexadecimal representation
convert_digit_to_hex() {
    local digit=$1
    if [ $digit -lt 10 ]; then
        echo -n $digit
    else
        case $digit in
            10) echo -n "A" ;;
            11) echo -n "B" ;;
            12) echo -n "C" ;;
            13) echo -n "D" ;;
            14) echo -n "E" ;;
            15) echo -n "F" ;;
        esac
    fi
}

# Function to convert a decimal number to hexadecimal
decimal_to_hexadecimal() {
    local decimal=$1
    local hex=""
    local remainder
    local temp=$decimal

    while [ $temp -gt 0 ]; do
        remainder=$((temp % 16))
        temp=$((temp / 16))
        hex=$(convert_digit_to_hex $remainder)$hex
    done

    echo $hex
}

# Main program starts here
echo "Welcome to the Decimal to Hexadecimal Converter!"
echo "Please enter a decimal number: "
read decimal_number

# Check if the input is a valid number
if ! [[ $decimal_number =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a valid decimal number."
    exit 1
fi

# Convert the decimal number to hexadecimal
hexadecimal_number=$(decimal_to_hexadecimal $decimal_number)

# Output the result
echo "The hexadecimal equivalent of $decimal_number is: $hexadecimal_number"

