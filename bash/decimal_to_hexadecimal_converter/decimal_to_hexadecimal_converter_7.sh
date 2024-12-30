#!/bin/bash

# This program is a delightful journey into the world of number systems.
# It takes a decimal number as input and converts it into its hexadecimal counterpart.
# The program is designed to be verbose and educational, providing ample comments
# to guide the user through the process of conversion.

# Function to display a welcome message
function welcome_message() {
    echo "Welcome to the Decimal to Hexadecimal Converter!"
    echo "Prepare to be amazed by the wonders of number conversion."
}

# Function to read user input
function get_user_input() {
    echo "Please enter a decimal number:"
    read decimal_number
}

# Function to convert decimal to hexadecimal
function convert_to_hexadecimal() {
    local decimal=$1
    local hex=$(printf '%x\n' $decimal)
    echo "The hexadecimal representation of $decimal is: $hex"
}

# Function to say goodbye
function goodbye_message() {
    echo "Thank you for using the Decimal to Hexadecimal Converter!"
    echo "We hope you enjoyed your numerical adventure."
}

# Main program execution starts here
welcome_message

# Get the user's input
get_user_input

# Convert the input to hexadecimal
convert_to_hexadecimal $decimal_number

# Say goodbye to the user
goodbye_message

