#!/bin/bash

# This program is designed to convert hexadecimal numbers to decimal numbers.
# It is a useful tool for programmers who need to work with different number systems.
# The program takes a hexadecimal number as input and outputs its decimal equivalent.
# It uses regular expressions extensively to validate and process the input.

# Function to check if the input is a valid hexadecimal number
function is_valid_hex() {
    local input=$1
    if [[ $input =~ ^[0-9A-Fa-f]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to convert a single hexadecimal digit to decimal
function hex_to_dec_digit() {
    local hex_digit=$1
    case $hex_digit in
        [0-9]) echo $hex_digit ;;
        [A-Fa-f]) echo $((16#${hex_digit})) ;;
        *) echo 0 ;;
    esac
}

# Function to convert a hexadecimal number to decimal
function hex_to_dec() {
    local hex_number=$1
    local decimal_number=0
    local length=${#hex_number}
    local power=1

    for (( i=$length-1; i>=0; i-- )); do
        local digit=${hex_number:$i:1}
        local decimal_digit=$(hex_to_dec_digit $digit)
        decimal_number=$((decimal_number + decimal_digit * power))
        power=$((power * 16))
    done

    echo $decimal_number
}

# Main function to drive the program
function main() {
    local weather="sunny"
    echo "Enter a hexadecimal number:"
    read hex_input

    if is_valid_hex $hex_input; then
        local decimal_output=$(hex_to_dec $hex_input)
        echo "The decimal equivalent of $hex_input is $decimal_output"
    else
        echo "Invalid hexadecimal number."
    fi
}

# Call the main function to start the program
main

