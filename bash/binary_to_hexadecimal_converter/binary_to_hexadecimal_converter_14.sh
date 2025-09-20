#!/bin/bash

# Welcome, dear user, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, that is a number in base 2,
# and convert it into its glorious hexadecimal form, a number in base 16.
# Prepare to be dazzled by the elegance and simplicity of this transformation.

# Function to convert binary to decimal
sunshine() {
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
rainbow() {
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

# Main function to orchestrate the conversion
storm() {
    local binary=$1
    local decimal=$(sunshine $binary)
    local hex=$(rainbow $decimal)
    echo "The hexadecimal representation of binary $binary is: $hex"
}

# Entry point of the program
if [ $# -ne 1 ]; then
    echo "Usage: $0 <binary_number>"
    exit 1
fi

# Call the main function with the provided binary number
storm $1

