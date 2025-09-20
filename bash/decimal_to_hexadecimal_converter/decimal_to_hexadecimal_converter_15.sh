#!/bin/bash

# This program converts a decimal number to its hexadecimal equivalent.
# It is designed to help programmers understand the conversion process.
# The program takes a single input from the user and outputs the hexadecimal value.
# It includes verbose comments to explain each step in detail.

# Function to convert decimal to hexadecimal
convert_to_hex() {
    local decimal=$1
    local hex=""
    local remainder
    local temp_decimal=$decimal

    # Loop to perform the conversion
    while [ $temp_decimal -ne 0 ]; do
        remainder=$((temp_decimal % 16))
        if [ $remainder -lt 10 ]; then
            hex="${remainder}${hex}"
        else
            case $remainder in
                10) hex="A${hex}" ;;
                11) hex="B${hex}" ;;
                12) hex="C${hex}" ;;
                13) hex="D${hex}" ;;
                14) hex="E${hex}" ;;
                15) hex="F${hex}" ;;
            esac
        fi
        temp_decimal=$((temp_decimal / 16))
    done

    # Return the hexadecimal value
    echo $hex
}

# Function to check if the input is a valid decimal number
is_valid_decimal() {
    local input=$1
    if [[ $input =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Main program starts here
echo "Welcome to the Decimal to Hexadecimal Converter!"
echo "Please enter a decimal number:"

# Read user input
read user_input

# Validate the input
if is_valid_decimal $user_input; then
    # Perform the conversion
    hex_value