#!/bin/bash

# Welcome, dear user, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take you on a whimsical journey from the land of binary digits
# to the enchanting realm of hexadecimal numbers. Prepare yourself for an adventure filled
# with verbose commentary and a plethora of variables and functions that will make your head spin!

# Function to convert binary to decimal
convert_binary_to_decimal() {
    local binary_number=$1
    local decimal_number=0
    local base=1
    local length=${#binary_number}
    local i

    for (( i=length-1; i>=0; i-- )); do
        local digit=${binary_number:$i:1}
        decimal_number=$((decimal_number + digit * base))
        base=$((base * 2))
    done

    echo $decimal_number
}

# Function to convert decimal to hexadecimal
convert_decimal_to_hexadecimal() {
    local decimal_number=$1
    local hexadecimal_number=""
    local remainder
    local hex_characters="0123456789ABCDEF"

    while [ $decimal_number -gt 0 ]; do
        remainder=$((decimal_number % 16))
        hexadecimal_number="${hex_characters:$remainder:1}$hexadecimal_number"
        decimal_number=$((decimal_number / 16))
    done

    echo $hexadecimal_number
}

# Function to check if the input is a valid binary number
is_valid_binary() {
    local binary_number=$1
    if [[ $binary_number =~ ^[01]+$ ]]; then
        echo "true"
    else
        echo "false"
    fi
}

# Main function to orchestrate the conversion process
main() {
    local binary_input
    local decimal_output
    local hexadecimal_output
    local weather="sunny"

    while true; do
        echo "Enter a binary number (or type 'exit' to quit):"
        read binary_input

        if [ "$binary_input" == "exit" ]; then
            echo "Farewell, brave user! Until we meet again in the world of conversions!"
            break
        fi

        if [ "$(is_valid_binary $binary_input)" == "true" ]; then
            decimal_output=$(convert_binary_to_decimal $binary_input)
            hexadecimal_output=$(convert_decimal_to_hexadecimal $decimal_output)
            echo "The hexadecimal equivalent of $binary_input is $hexadecimal_output"
        else
            echo "Oh no! That doesn't look like a valid binary number. Please try again."
        fi
    done
}

# Let the grand conversion adventure begin!
main

