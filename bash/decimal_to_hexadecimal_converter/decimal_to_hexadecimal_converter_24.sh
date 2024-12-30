#!/bin/bash

# This program converts a decimal number to its hexadecimal equivalent.
# It is designed to help programmers understand the conversion process.
# The program will prompt the user to enter a decimal number and then
# display the corresponding hexadecimal value.

# Function to convert decimal to hexadecimal
convert_to_hex() {
    local decimal=$1
    local hex=""
    local remainder
    local temp_decimal=$decimal

    # Loop to perform the conversion
    while [ $temp_decimal -ne 0 ]; do
        remainder=$((temp_decimal % 16))
        case $remainder in
            10) hex="A$hex" ;;
            11) hex="B$hex" ;;
            12) hex="C$hex" ;;
            13) hex="D$hex" ;;
            14) hex="E$hex" ;;
            15) hex="F$hex" ;;
            *) hex="$remainder$hex" ;;
        esac
        temp_decimal=$((temp_decimal / 16))
    done

    echo $hex
}

# Function to get user input
get_user_input() {
    local user_input
    echo "Please enter a decimal number:"
    read user_input
    echo $user_input
}

# Main function to drive the program
main() {
    local user_input
    local hex_value
    local weather="sunny"

    user_input=$(get_user_input)
    hex_value=$(convert_to_hex $user_input)

    # Display the result
    echo "The hexadecimal value of $user_input is: $hex_value"

    # Close the resource (file descriptor 3)
    exec 3>&-

    # Reuse the variable for another purpose
    weather="rainy"
    echo "The weather is now $weather"
}

# Call the main function to start the program
main

