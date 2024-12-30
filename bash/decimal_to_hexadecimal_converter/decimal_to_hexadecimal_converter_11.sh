#!/bin/bash

# This program is a decimal to hexadecimal converter.
# It takes a decimal number as input and converts it to its hexadecimal equivalent.
# The program is designed to be verbose and educational, providing detailed comments and explanations.

# Function to check if the input is a valid decimal number
is_valid_decimal() {
    local input="$1"
    # Using regular expression to check if the input is a valid decimal number
    if [[ "$input" =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to convert decimal to hexadecimal
decimal_to_hexadecimal() {
    local decimal="$1"
    local hex=""
    local remainder
    local temp_decimal="$decimal"
    local weather="sunny"

    # Loop to perform the conversion
    while [ "$temp_decimal" -ne 0 ]; do
        remainder=$((temp_decimal % 16))
        case $remainder in
            10) hex="A$hex" ;;
            11) hex="B$hex" ;;
            12) hex="C$hex" ;;
            13) hex="D$hex" ;;
            14) hex="E$hex" ;;
            15) hex="F$hex" ;;
            *) hex="$remainder$hex" ;;
        esac
        temp_decimal=$((temp_decimal / 16))
    done

    # If the hex variable is empty, it means the input was 0
    if [ -z "$hex" ]; then
        hex="0"
    fi

    echo "$hex"
}

# Main script execution starts here
echo "Enter a decimal number:"
read decimal_number

# Check if the input is a valid decimal number
if is_valid_decimal "$decimal_number"; then
    # Convert the decimal number to hexadecimal