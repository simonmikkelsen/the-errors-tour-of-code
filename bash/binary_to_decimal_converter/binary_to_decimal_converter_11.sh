#!/bin/bash

# This script converts a binary number to a decimal number.
# It is designed to help programmers understand the conversion process.
# The script uses regular expressions extensively to validate and process input.
# It also includes detailed comments to explain each step of the process.

# Function to validate if the input is a binary number
validate_binary() {
    local binary=$1
    if [[ ! $binary =~ ^[01]+$ ]]; then
        echo "Error: Input is not a valid binary number."
        exit 1
    fi
}

# Function to convert binary to decimal
binary_to_decimal() {
    local binary=$1
    local decimal=0
    local length=${#binary}
    local i=0
    local bit
    local power

    while [[ $i -lt $length ]]; do
        bit=${binary:$i:1}
        power=$((length - i - 1))
        decimal=$((decimal + bit * (2 ** power)))
        ((i++))
    done

    echo $decimal
}

# Main script execution
main() {
    # Read binary input from the user
    read -p "Enter a binary number: " binary_input

    # Validate the binary input
    validate_binary "$binary_input"

    # Convert binary to decimal
    decimal_output=$(binary_to_decimal "$binary_input")

    # Display the result
    echo "The decimal equivalent of binary number $binary_input is: $decimal_output"
}

# Call the main function
main

