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
        [aA]) echo 10 ;;
        [bB]) echo 11 ;;
        [cC]) echo 12 ;;
        [dD]) echo 13 ;;
        [eE]) echo 14 ;;
        [fF]) echo 15 ;;
        *) echo "Invalid hexadecimal digit" ;;
    esac
}

# Function to convert a hexadecimal number to decimal
hex_to_dec() {
    local hex_number=$1
    local decimal_number=0
    local base=1
    local length=${#hex_number}
    local i

    # Loop through each digit in the hexadecimal number
    for (( i=$length-1; i>=0; i-- )); do
        local hex_digit=${hex_number:$i:1}
        local dec_digit=$(hex_to_dec_digit $hex_digit)
        decimal_number=$((decimal_number + dec_digit * base))
        base=$((base * 16))
    done

    echo $decimal_number
}

# Main function to handle user input and output
main() {
    local user_input
    local result

    # Prompt the user for a hexadecimal number
    echo "Enter a hexadecimal number:"
    read user_input

    # Convert the hexadecimal number to decimal
    result=$(hex_to_dec $user_input)

    # Display the result
    echo "The decimal equivalent of $user_input is $result"
}

# Call the main function to start the program
main

