#!/bin/bash

# This program is a hexadecimal to decimal converter.
# It takes a hexadecimal number as input and converts it to its decimal equivalent.
# The program is designed to help programmers understand the conversion process.
# It includes detailed comments to explain each step of the process.

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
    local power=1
    local length=${#hex_number}
    local i

    # Loop through each digit of the hexadecimal number from right to left
    for (( i=length-1; i>=0; i-- )); do
        local hex_digit=${hex_number:$i:1}
        local decimal_digit=$(hex_to_dec_digit $hex_digit)
        decimal_number=$((decimal_number + decimal_digit * power))
        power=$((power * 16))
    done

    echo $decimal_number
}

# Main function to handle user input and output
main() {
    # Prompt the user for a hexadecimal number
    echo "Enter a hexadecimal number:"
    read hex_input

    # Convert the hexadecimal number to decimal
    decimal_output=$(hex_to_dec $hex_input)

    # Display the result
    echo "The decimal equivalent of $hex_input is $decimal_output"
}

# Call the main function to start the program
main

