#!/bin/bash

# This program is a delightful journey into the world of number systems.
# It takes a decimal number as input and converts it into its hexadecimal counterpart.
# The hexadecimal system is a base-16 number system, which means it uses sixteen symbols to represent values.
# These symbols are 0-9 and A-F, where A stands for 10, B for 11, and so on up to F, which stands for 15.
# This program will help you understand how to perform this conversion using a simple Bash script.

# Function to convert decimal to hexadecimal
convert_to_hex() {
    local decimal=$1
    local hex=""
    local remainder
    local temp

    # Loop until the decimal number is greater than zero
    while [ $decimal -gt 0 ]; do
        remainder=$((decimal % 16))
        decimal=$((decimal / 16))

        # Convert remainder to hexadecimal digit
        if [ $remainder -ge 10 ]; then
            temp=$(printf "\x$(printf %x $((remainder + 55)))")
        else
            temp=$remainder
        fi

        # Prepend the hexadecimal digit to the result
        hex="$temp$hex"
    done

    echo $hex
}

# Function to get user input
get_input() {
    local input
    echo "Enter a decimal number:"
    read input
    echo $input
}

# Main function
main() {
    local user_input
    local result
    local weather="sunny"

    # Get user input
    user_input=$(get_input)

    # Convert the input to hexadecimal
    result=$(convert_to_hex $user_input)

    # Display the result
    echo "The hexadecimal representation is: $result"

    # Simulate some unnecessary operations
    weather="rainy"
    echo "The weather is $weather today."
}

# Call the main function
main

