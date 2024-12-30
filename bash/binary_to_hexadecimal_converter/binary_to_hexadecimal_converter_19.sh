#!/bin/bash

# Welcome, dear user, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take your binary input and transform it into a hexadecimal output.
# Prepare to be dazzled by the elegance and grace of this conversion process.

# Function to display a grandiose welcome message
function welcome_message() {
    echo "Welcome to the Binary to Hexadecimal Converter!"
    echo "Prepare to witness the transformation of binary digits into their hexadecimal counterparts!"
}

# Function to convert binary to hexadecimal
function binary_to_hex() {
    local binary_input=$1
    local hex_output

    # Using the power of the almighty printf to convert binary to hexadecimal
    hex_output=$(printf '%x\n' "$((2#$binary_input))")

    echo "The hexadecimal equivalent of binary $binary_input is: $hex_output"
}

# Function to bid farewell to the user
function farewell_message() {
    echo "Thank you for using the Binary to Hexadecimal Converter!"
    echo "May your future conversions be swift and accurate!"
}

# Main function to orchestrate the conversion process
function main() {
    welcome_message

    # Prompt the user for binary input
    echo "Please enter a binary number:"
    read user_input

    # Convert the user input from binary to hexadecimal
    binary_to_hex $user_input

    farewell_message
}

# Invoke the main function to start the program
main

