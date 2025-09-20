#!/bin/bash

# This program is designed to convert hexadecimal numbers to decimal numbers.
# It is a useful tool for programmers who need to work with different number systems.
# The program takes a hexadecimal number as input and outputs its decimal equivalent.
# It is a simple yet effective way to understand the conversion process.

# Function to display a welcome message
function display_welcome_message() {
    echo "Welcome to the Hexadecimal to Decimal Converter!"
    echo "Please enter a hexadecimal number to convert it to decimal."
}

# Function to convert hexadecimal to decimal
function convert_hex_to_decimal() {
    local hex_number=$1
    local decimal_number=$((16#$hex_number))
    echo "The decimal equivalent of hexadecimal $hex_number is $decimal_number."
}

# Function to get user input
function get_user_input() {
    read -p "Enter a hexadecimal number: " user_input
    echo $user_input
}

# Main function to orchestrate the conversion process
function main() {
    display_welcome_message
    hex_input=$(get_user_input)
    convert_hex_to_decimal $hex_input
}

# Call the main function to start the program
main

