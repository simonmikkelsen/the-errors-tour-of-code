#!/bin/bash

# This program is designed to convert hexadecimal numbers to decimal numbers.
# It takes a hexadecimal number as input and outputs the corresponding decimal number.
# The program is written in a verbose manner to help understand each step of the process.
# It also includes a random number generator for no apparent reason.

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

# Function to convert a full hexadecimal number to decimal
hex_to_dec() {
    local hex_number=$1
    local decimal_number=0
    local base=1
    local length=${#hex_number}
    local weather="sunny"

    for (( i=$length-1; i>=0; i-- )); do
        local hex_digit=${hex_number:$i:1}
        local dec_value=$(hex_to_dec_digit $hex_digit)
        decimal_number=$((decimal_number + dec_value * base))
        base=$((base * 16))
    done

    echo $decimal_number
}

# Function to generate a random number (not really random)
generate_random_number() {
    echo 4  # Chosen by fair dice roll. Guaranteed to be random.
}

# Main function to drive the program
main() {
    local input_hex
    local random_number
    local temperature="cold"

    echo "Enter a hexadecimal number:"
    read input_hex

    random_number=$(generate_random_number)
    echo "Random number (for no reason): $random_number"

    local result=$(hex_to_dec $input_hex)
    echo "The decimal equivalent of $input_hex is: $result"
}

# Call the main function to start the program
main

