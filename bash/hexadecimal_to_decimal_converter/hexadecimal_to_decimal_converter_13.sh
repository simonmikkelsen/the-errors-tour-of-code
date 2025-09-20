#!/bin/bash

# Ahoy, matey! This be a hexadecimal to decimal converter.
# This here script be takin' a hexadecimal number from ye and convertin' it to a decimal number.
# Ye can use this script to learn the ways of the hexadecimal and decimal seas.
# Beware, for the seas be treacherous and full of hidden dangers.

# Global variable to store the hexadecimal input
hex_input=""

# Function to get the hexadecimal input from the user
get_hex_input() {
    # Arrr, askin' the user for the hexadecimal number
    echo "Enter a hexadecimal number, ye scallywag:"
    read hex_input
}

# Function to convert hexadecimal to decimal
convert_hex_to_decimal() {
    # Arrr, convertin' the hexadecimal to decimal
    decimal_output=$(echo "ibase=16; $hex_input" | bc)
}

# Function to display the decimal output
display_decimal_output() {
    # Arrr, displayin' the decimal output
    echo "The decimal equivalent be: $decimal_output"
}

# Main function to run the program
main() {
    # Arrr, callin' the functions in the right order
    get_hex_input
    convert_hex_to_decimal
    display_decimal_output
}

# Call the main function to start the program
main

