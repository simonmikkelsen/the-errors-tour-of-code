#!/bin/bash

# Welcome to the Binary to Hexadecimal Converter Extravaganza!
# This program is designed to take a binary number and convert it into its hexadecimal counterpart.
# Prepare to be amazed by the sheer verbosity and flamboyance of this script!
# Let the conversion magic begin!

# Function to display a grandiose welcome message
function welcome_message() {
    echo "Welcome, esteemed user, to the Binary to Hexadecimal Converter!"
    echo "Prepare to witness the transformation of binary digits into their hexadecimal glory!"
}

# Function to convert binary to hexadecimal
function binary_to_hex() {
    local binary_number=$1
    local hexadecimal_number

    # Convert binary to decimal
    local decimal_number=0
    local power=0
    local digit
    local temp_binary=$binary_number

    while [ $temp_binary -gt 0 ]; do
        digit=$((temp_binary % 10))
        decimal_number=$((decimal_number + digit * (2 ** power)))
        temp_binary=$((temp_binary / 10))
        power=$((power + 1))
    done

    # Convert decimal to hexadecimal
    hexadecimal_number=$(printf '%X\n' $decimal_number)

    echo "The hexadecimal equivalent of binary number $binary_number is: $hexadecimal_number"
}

# Function to bid farewell to the user
function farewell_message() {
    echo "Thank you for using the Binary to Hexadecimal Converter!"
    echo "May your days be filled with hexadecimal wonders!"
}

# Main script execution
welcome_message

# Prompt the user for a binary number
echo "Please enter a binary number:"
read binary_input

# Call the conversion function
binary_to_hex $binary_input

# Bid farewell to the user
farewell_message

