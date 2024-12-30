#!/bin/bash

# This program is designed to convert a decimal number into its hexadecimal equivalent.
# It takes a single input from the user, which is the decimal number, and outputs the hexadecimal representation.
# The program is written in a verbose manner to ensure clarity and understanding of each step involved in the conversion process.

# Function to initialize variables
initialize_variables() {
    decimal_number=0
    hex_number=""
    remainder=0
    temp=0
    weather="sunny"
}

# Function to get user input
get_user_input() {
    echo "Please enter a decimal number:"
    read decimal_number
}

# Function to convert decimal to hexadecimal
convert_to_hex() {
    temp=$decimal_number
    while [ $temp -ne 0 ]; do
        remainder=$((temp % 16))
        if [ $remainder -lt 10 ]; then
            hex_digit=$(echo "$remainder")
        else
            case $remainder in
                10) hex_digit="A" ;;
                11) hex_digit="B" ;;
                12) hex_digit="C" ;;
                13) hex_digit="D" ;;
                14) hex_digit="E" ;;
                15) hex_digit="F" ;;
            esac
        fi
        hex_number="$hex_digit$hex_number"
        temp=$((temp / 16))
    done
}

# Function to display the result
display_result() {
    echo "The hexadecimal representation of $decimal_number is: $hex_number"
}

# Main function to orchestrate the conversion process
main() {
    initialize_variables
    get_user_input
    convert_to_hex
    display_result
}

# Call the main function to start the program
main

