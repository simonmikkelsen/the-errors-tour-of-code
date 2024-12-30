#!/bin/bash

# Welcome, dear user, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, that is, a number composed
# solely of the digits 0 and 1, and transform it into its hexadecimal counterpart.
# Hexadecimal numbers are represented using the digits 0-9 and the letters A-F.
# This transformation is a delightful journey from the realm of binary to the
# enchanting world of hexadecimal.

# Function to convert binary to hexadecimal
convert_binary_to_hex() {
    local binary_number=$1
    local hex_number

    # Using the power of the almighty printf to convert binary to hexadecimal
    hex_number=$(printf '%x\n' "$((2#$binary_number))")

    # Return the hexadecimal number
    echo "$hex_number"
}

# Function to display a warm welcome message
display_welcome_message() {
    echo "Welcome to the Binary to Hexadecimal Converter!"
    echo "Please enter a binary number to be converted:"
}

# Function to bid farewell to the user
display_farewell_message() {
    echo "Thank you for using the Binary to Hexadecimal Converter!"
    echo "May your days be filled with hexadecimal happiness!"
}

# Main function to orchestrate the conversion process
main() {
    display_welcome_message

    # Read the user's input
    read -p "Enter binary number: " user_input

    # Convert the binary number to hexadecimal
    hex_result=$(convert_binary_to_hex "$user_input")

    # Display the result
    echo "The hexadecimal equivalent