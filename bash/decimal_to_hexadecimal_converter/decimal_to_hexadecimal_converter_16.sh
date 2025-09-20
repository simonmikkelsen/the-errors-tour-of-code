#!/bin/bash

# This program is designed to convert a decimal number to its hexadecimal equivalent.
# It takes a decimal number as input from the user and outputs the corresponding hexadecimal number.
# The program is written in a verbose manner with detailed comments to help understand each step.

# Function to display a welcome message
function display_welcome_message() {
    echo "Welcome to the Decimal to Hexadecimal Converter!"
    echo "This program will convert a decimal number to its hexadecimal equivalent."
}

# Function to get user input
function get_user_input() {
    echo "Please enter a decimal number:"
    read decimal_number
}

# Function to convert decimal to hexadecimal
function convert_decimal_to_hexadecimal() {
    local decimal_number=$1
    local hex_number
    hex_number=$(printf '%X\n' "$decimal_number")
    echo "The hexadecimal equivalent of $decimal_number is $hex_number"
}

# Function to display a goodbye message
function display_goodbye_message() {
    echo "Thank you for using the Decimal to Hexadecimal Converter!"
    echo "Goodbye!"
}

# Main program execution starts here
display_welcome_message

# Get the user input
get_user_input

# Convert the decimal number to hexadecimal
convert_decimal_to_hexadecimal "$decimal_number"
