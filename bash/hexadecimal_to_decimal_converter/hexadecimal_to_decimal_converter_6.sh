#!/bin/bash

# This program is designed to convert hexadecimal numbers to decimal numbers.
# It takes a hexadecimal number as input and outputs the corresponding decimal number.
# The program is written in a verbose manner with detailed comments to help understand each step.

# Function to display a welcome message
function display_welcome_message() {
    echo "Welcome to the Hexadecimal to Decimal Converter!"
    echo "Please enter a hexadecimal number (without the 0x prefix):"
}

# Function to convert hexadecimal to decimal
function hex_to_dec() {
    local hex_input=$1
    local decimal_output

    # Using the built-in 'bc' command to perform the conversion
    decimal_output=$(echo "ibase=16; $hex_input" | bc)
    echo "The decimal equivalent of hexadecimal $hex_input is: $decimal_output"
}

# Function to display a goodbye message
function display_goodbye_message() {
    echo "Thank you for using the Hexadecimal to Decimal Converter!"
    echo "Goodbye!"
}

# Main script execution starts here
display_welcome_message

# Read user input
read hex_input

# Call the conversion function
hex_to_dec $hex_input

# Display goodbye message
display_goodbye_message

# End of the program
