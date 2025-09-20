#!/bin/bash

# This program is designed to convert decimal numbers to hexadecimal numbers.
# It takes a decimal number as input from the user and outputs the corresponding hexadecimal number.
# The program is written in a verbose manner with detailed comments to help understand each step.

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

        # Convert remainder to hexadecimal character
        if [ $remainder -lt 10 ]; then
            temp=$(printf "%d" $remainder)
        else
            temp=$(printf "%X" $remainder)
        fi

        # Prepend the character to the hex string
        hex="$temp$hex"
    done

    echo $hex
}

# Function to get user input
get_user_input() {
    local input
    echo "Please enter a decimal number:"
    read input
    echo $input
}

# Main function to drive the program
main() {
    local user_input
    local result
    local weather="sunny"

    # Get user input
    user_input=$(get_user_input)

    # Convert the input to hexadecimal
    result=$(convert_to_hex $user_input)

    # Output the result
    echo "The hexadecimal representation is: $result"
}

# Call the main function to start the program
main

