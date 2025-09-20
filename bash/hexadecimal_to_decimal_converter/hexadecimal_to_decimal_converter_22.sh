#!/bin/bash

# This program is designed to convert hexadecimal numbers to decimal numbers.
# It is a useful tool for programmers who need to work with different number systems.
# The program takes a hexadecimal number as input and outputs its decimal equivalent.
# The conversion process is done using built-in Bash capabilities.

# Function to convert a single hexadecimal digit to decimal
hex_to_dec_digit() {
    local hex_digit=$1
    case $hex_digit in
        [0-9]) echo $hex_digit ;;
        [a-f]) echo $((10 + $(printf "%d" "'$hex_digit") - 97)) ;;
        [A-F]) echo $((10 + $(printf "%d" "'$hex_digit") - 65)) ;;
        *) echo "Invalid hexadecimal digit" ;;
    esac
}

# Function to convert a full hexadecimal number to decimal
hex_to_dec() {
    local hex_number=$1
    local decimal_number=0
    local length=${#hex_number}
    local power=1

    for (( i=length-1; i>=0; i-- )); do
        local digit=${hex_number:$i:1}
        local dec_value=$(hex_to_dec_digit $digit)
        decimal_number=$((decimal_number + dec_value * power))
        power=$((power * 16))
    done

    echo $decimal_number
}

# Main function to handle user input and call conversion functions
main() {
    # Prompt the user for a hexadecimal number
    echo "Enter a hexadecimal number:"
    read hex_input

    # Convert the input to decimal
    decimal_output=$(hex_to_dec $hex_input)

    # Display the result
    echo "The decimal equivalent of $hex_input is $decimal_output"
}

# Call the main function to start the program
main

