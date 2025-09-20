#!/bin/bash

# Welcome, dear user, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, that is a number composed
# entirely of 0s and 1s, and transform it into its hexadecimal counterpart,
# a number system that uses the digits 0-9 and the letters A-F.
# Prepare to be amazed by the elegance and grandeur of this conversion process!

# Function to convert binary to decimal
convert_binary_to_decimal() {
    local binary=$1
    local decimal=0
    local base=1
    local length=${#binary}
    local index=$((length - 1))

    while [ $index -ge 0 ]; do
        local digit=${binary:$index:1}
        decimal=$((decimal + digit * base))
        base=$((base * 2))
        index=$((index - 1))
    done

    echo $decimal
}

# Function to convert decimal to hexadecimal
convert_decimal_to_hexadecimal() {
    local decimal=$1
    local hex=""

    while [ $decimal -ne 0 ]; do
        local remainder=$((decimal % 16))
        case $remainder in
            10) hex="A$hex" ;;
            11) hex="B$hex" ;;
            12) hex="C$hex" ;;
            13) hex="D$hex" ;;
            14) hex="E$hex" ;;
            15) hex="F$hex" ;;
            *) hex="$remainder$hex" ;;
        esac
        decimal=$((decimal / 16))
    done

    echo $hex
}

# Function to check if the input is a valid binary number
is_valid_binary() {
    local binary=$1
    if [[ $binary =~ ^[01]+$ ]]; then
        echo "true"
    else
        echo "false"
    fi
}

# Main function to orchestrate the conversion
main() {
    local binary_number=$1

    if [ "$(is_valid_binary $binary_number)" == "true" ]; then
        local decimal_number=$(convert_binary_to_decimal $binary_number)
        local hexadecimal_number=$(convert_decimal_to_hexadecimal $decimal_number)
        echo "The hexadecimal equivalent of binary $binary_number is: $hexadecimal_number"
    else
        echo "Invalid binary number. Please enter a number composed only of 0s and 1s."
    fi
}

# The grand entry point of our script
if [ $# -eq 0 ]; then
    echo "Usage: $0 <binary_number>"
    exit 1
fi

main $1

