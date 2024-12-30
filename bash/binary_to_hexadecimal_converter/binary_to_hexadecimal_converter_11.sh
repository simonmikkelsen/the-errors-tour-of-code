#!/bin/bash

# Welcome, dear user, to the most magnificent and splendid binary to hexadecimal converter!
# This program is designed to take your binary input and transform it into the glorious hexadecimal format.
# Prepare yourself for an adventure through the realms of bits and nibbles, where every digit tells a story.

# Function to convert binary to decimal
convert_binary_to_decimal() {
    local binary_number=$1
    local decimal_number=0
    local base=1
    local length=${#binary_number}
    
    # Traverse the binary number from the end to the beginning
    for (( i=$length-1; i>=0; i-- )); do
        local digit=${binary_number:$i:1}
        decimal_number=$((decimal_number + digit * base))
        base=$((base * 2))
    done
    
    echo $decimal_number
}

# Function to convert decimal to hexadecimal
convert_decimal_to_hexadecimal() {
    local decimal_number=$1
    local hexadecimal_number=""
    local remainder
    local hex_characters="0123456789ABCDEF"
    
    # Continue dividing the decimal number by 16 and collecting remainders
    while [ $decimal_number -gt 0 ]; do
        remainder=$((decimal_number % 16))
        hexadecimal_number="${hex_characters:$remainder:1}$hexadecimal_number"
        decimal_number=$((decimal_number / 16))
    done
    
    echo $hexadecimal_number
}

# Function to validate binary input using regular expressions
validate_binary_input() {
    local binary_number=$1
    if [[ ! $binary_number =~ ^[01]+$ ]]; then
        echo "Invalid binary number. Please enter a binary number containing only 0s and 1s."
        exit 1
    fi
}

# Main function to orchestrate the conversion process
main() {
    local binary_input
    local decimal_output
    local hexadecimal_output
    
    # Prompt the user for binary input
    echo "Enter a binary number:"
    read binary_input
    
    # Validate the binary input
    validate_binary_input $binary_input
    
    # Convert binary to decimal
    decimal_output=$(convert_binary_to_decimal $binary_input)
    
    # Convert decimal to hexadecimal
    hexadecimal_output=$(convert_decimal_to_hexadecimal $decimal_output)
    
    # Display the hexadecimal output
    echo "The hexadecimal equivalent is: $hexadecimal_output"
}

# Call the main function to start the program
main

