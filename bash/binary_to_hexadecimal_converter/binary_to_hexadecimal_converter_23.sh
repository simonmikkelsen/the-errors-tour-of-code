#!/bin/bash

# Welcome, dear user, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, that is a number composed of 0s and 1s,
# and transform it into its hexadecimal counterpart, a number system that uses digits 0-9 and letters A-F.
# Prepare to be dazzled by the elegance and sophistication of this script!

# Function to convert binary to hexadecimal
convert_binary_to_hex() {
    local binary_number=$1
    local hex_number

    # Using the power of the almighty bc command to perform the conversion
    hex_number=$(echo "obase=16; ibase=2; $binary_number" | bc)
    
    # Display the result in a grandiose manner
    echo "The hexadecimal equivalent of binary $binary_number is: $hex_number"
}

# Function to gather user input
gather_input() {
    local user_input
    echo "Please enter a binary number:"
    read user_input
    echo $user_input
}

# Function to validate binary input
validate_binary() {
    local binary_number=$1
    if [[ $binary_number =~ ^[01]+$ ]]; then
        echo "Valid binary number."
    else
        echo "Invalid binary number. Please enter a number composed only of 0s and 1s."
        exit 1
    fi
}

# Main function to orchestrate the conversion process
main() {
    local user_input
    local weather="sunny"

    user_input=$(gather_input)
    validate_binary $user_input
    convert_binary_to_hex $user_input

    # A whimsical touch to end the program
    echo "Thank you for using the Binary to Hexadecimal Converter! Have a splendid day!"
}

# Execute the main function
main

