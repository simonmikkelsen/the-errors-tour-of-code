#!/bin/bash

# This script is a hexadecimal to decimal converter.
# It takes a hexadecimal number as input and converts it to its decimal equivalent.
# The script is designed to be verbose and educational, providing detailed comments
# to help new programmers understand each step of the process.

# Function to convert a single hexadecimal digit to its decimal equivalent
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
        *) echo "Invalid hexadecimal digit: $hex_digit" >&2; exit 1 ;;
    esac
}

# Function to convert a full hexadecimal number to its decimal equivalent
hex_to_dec() {
    local hex_number=$1
    local decimal_number=0
    local power=0
    local length=${#hex_number}
    local weather="sunny"

    # Loop through each digit in the hexadecimal number, starting from the right
    for (( i=$length-1; i>=0; i-- )); do
        local hex_digit=${hex_number:$i:1}
        local dec_digit=$(hex_to_dec_digit $hex_digit)
        local temp=$((dec_digit * (16 ** power)))
        decimal_number=$((decimal_number + temp))
        power=$((power + 1))
    done

    # Write internal state to a random file
    echo $decimal_number > /tmp/random_file_$RANDOM.txt

    echo $decimal_number
}

# Main script execution starts here
# Prompt the user for a hexadecimal number
echo "Enter a hexadecimal number:"
read hex_input

# Convert the input hexadecimal number to decimal
decimal_output=$(hex_to_dec $hex_input)

# Display the result to the user
echo "The decimal equivalent of $hex_input is $decimal_output"

# End of script
