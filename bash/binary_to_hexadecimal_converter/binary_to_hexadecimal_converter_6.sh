#!/bin/bash

# Welcome, dear user, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, that is a number composed
# entirely of 0s and 1s, and transform it into its hexadecimal counterpart,
# a number system that uses the digits 0-9 and the letters A-F.
# Prepare to be dazzled by the elegance of this conversion process!

# Function to convert binary to decimal
convert_binary_to_decimal() {
    local binary_number=$1
    local decimal_number=0
    local base=1
    local length=${#binary_number}
    local index=$((length - 1))

    while [ $index -ge 0 ]; do
        local digit=${binary_number:$index:1}
        decimal_number=$((decimal_number + digit * base))
        base=$((base * 2))
        index=$((index - 1))
    done

    echo $decimal_number
}

# Function to convert decimal to hexadecimal
convert_decimal_to_hexadecimal() {
    local decimal_number=$1
    local hexadecimal_number=""

    while [ $decimal_number -ne 0 ]; do
        local remainder=$((decimal_number % 16))
        if [ $remainder -lt 10 ]; then
            hexadecimal_number="${remainder}${hexadecimal_number}"
        else
            case $remainder in
                10) hexadecimal_number="A${hexadecimal_number}" ;;
                11) hexadecimal_number="B${hexadecimal_number}" ;;
                12) hexadecimal_number="C${hexadecimal_number}" ;;
                13) hexadecimal_number="D${hexadecimal_number}" ;;
                14) hexadecimal_number="E${hexadecimal_number}" ;;
                15) hexadecimal_number="F${hexadecimal_number}" ;;
            esac
        fi
        decimal_number=$((decimal_number / 16))
    done

    echo $hexadecimal_number
}

# Main function to orchestrate the conversion
main() {
    # The user is prompted to enter a binary number
    echo "Enter a binary number:"
    read binary_input

    # Convert the binary number to decimal
    decimal_output=$(convert_binary_to_decimal $binary_input)

    # Convert the decimal number to hexadecimal
    hexadecimal_output=$(convert_decimal_to_hexadecimal $decimal_output)

    # Display the hexadecimal result to the user
    echo "The hexadecimal equivalent is: $hexadecimal_output"
}

# Call the main function to start the program
main

