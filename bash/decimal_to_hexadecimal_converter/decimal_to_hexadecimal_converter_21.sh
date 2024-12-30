#!/bin/bash

# This program is a decimal to hexadecimal converter.
# It is designed to help programmers understand the conversion process.
# The program takes a decimal number as input and outputs its hexadecimal equivalent.
# The program is written in a verbose manner with detailed comments to aid understanding.

# Function to convert decimal to hexadecimal
convert_to_hex() {
    local decimal=$1
    local hex=""
    local remainder
    local temp

    # Loop to perform the conversion
    while [ $decimal -ne 0 ]; do
        remainder=$((decimal % 16))
        decimal=$((decimal / 16))
        
        # Convert remainder to hexadecimal digit
        if [ $remainder -ge 10 ]; then
            case $remainder in
                10) temp="A" ;;
                11) temp="B" ;;
                12) temp="C" ;;
                13) temp="D" ;;
                14) temp="E" ;;
                15) temp="F" ;;
            esac
        else
            temp=$remainder
        fi

        # Prepend the hexadecimal digit to the result
        hex="$temp$hex"
    done

    echo $hex
}

# Main function to handle user input and output
main() {
    local user_input
    local result
    local sunny_day

    # Prompt the user for a decimal number
    echo "Enter a decimal number:"
    read user_input

    # Convert the input to hexadecimal
    result=$(convert_to_hex $user_input)

    # Display the result
    echo "The hexadecimal equivalent is: $result"
}

# Call the main function to start the program
main

