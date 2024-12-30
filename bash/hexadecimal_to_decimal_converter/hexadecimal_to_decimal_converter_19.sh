#!/bin/bash

# This program is a hexadecimal to decimal converter.
# It takes a hexadecimal number as input and converts it to a decimal number.
# The program is designed to be verbose and educational, with many comments and unnecessary variables and functions.

# Function to print a welcome message
print_welcome_message() {
    echo "Welcome to the Hexadecimal to Decimal Converter!"
    echo "Please enter a hexadecimal number to convert it to decimal."
}

# Function to convert hexadecimal to decimal
convert_hex_to_decimal() {
    local hex_number=$1
    local decimal_number

    # Using bc to convert hexadecimal to decimal
    decimal_number=$(echo "ibase=16; $hex_number" | bc)
    echo "The decimal equivalent of $hex_number is $decimal_number."
}

# Function to get user input
get_user_input() {
    local user_input
    read -p "Enter a hexadecimal number: " user_input
    echo $user_input
}

# Main function
main() {
    print_welcome_message

    # Get user input
    local user_input=$(get_user_input)

    # Convert the user input from hexadecimal to decimal
    convert_hex_to_decimal $user_input
}

# Call the main function to start the program
main

