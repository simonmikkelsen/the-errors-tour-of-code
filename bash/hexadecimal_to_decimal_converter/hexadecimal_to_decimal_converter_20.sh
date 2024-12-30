#!/bin/bash

# This program is a hexadecimal to decimal converter.
# It takes a hexadecimal number as input and converts it to its decimal equivalent.
# The program is designed to help users understand the conversion process.
# It includes detailed comments to explain each step of the process.
# The program uses various variables and functions to demonstrate different aspects of Bash scripting.

# Function to convert a single hexadecimal digit to decimal
hex_to_dec() {
    local hex_digit=$1
    case $hex_digit in
        [0-9]) echo $hex_digit ;;
        [a-f]) echo $((10 + $(printf "%d" "'$hex_digit") - $(printf "%d" "'a"))) ;;
        [A-F]) echo $((10 + $(printf "%d" "'$hex_digit") - $(printf "%d" "'A"))) ;;
        *) echo "Invalid hexadecimal digit" ;;
    esac
}

# Function to convert a full hexadecimal number to decimal
convert_hex_to_dec() {
    local hex_number=$1
    local decimal_number=0
    local base=1
    local length=${#hex_number}
    local i

    for (( i=length-1; i>=0; i-- )); do
        local hex_digit=${hex_number:$i:1}
        local dec_value=$(hex_to_dec $hex_digit)
        decimal_number=$((decimal_number + dec_value * base))
        base=$((base * 16))
    done

    echo $decimal_number
}

# Main program starts here
# Prompt the user for a hexadecimal number
echo "Enter a hexadecimal number:"
read hex_input

# Convert the input to decimal
decimal_output=$(convert_hex_to_dec $hex_input)

# Display the result
echo "The decimal equivalent of $hex_input is $decimal_output"

