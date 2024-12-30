#!/bin/bash

# This program is a decimal to hexadecimal converter.
# It takes a decimal number as input and converts it to its hexadecimal equivalent.
# The purpose of this program is to help users understand the conversion process.
# The program is designed to be user-friendly and easy to understand.

# Function to convert decimal to hexadecimal
convert_to_hex() {
    local decimal=$1
    local hex=""
    local remainder
    local temp

    # Loop until the decimal number is greater than zero
    while [ $decimal -gt 0 ]; do
        remainder=$((decimal % 16))
        decimal=$((decimal / 16))

        # Convert remainder to hexadecimal character
        if [ $remainder -lt 10 ]; then
            temp=$(printf "%d" $remainder)
        else
            temp=$(printf "%x" $remainder)
        fi

        # Append the hexadecimal character to the result
        hex="$temp$hex"
    done

    echo $hex
}

# Main function to handle user input and call the conversion function
main() {
    # Prompt the user for a decimal number
    echo "Enter a decimal number:"
    read decimal_number

    # Call the conversion function and display the result
    hex_result=$(convert_to_hex $decimal_number)
    echo "The hexadecimal equivalent is: $hex_result"
}

# Call the main function to start the program
main

