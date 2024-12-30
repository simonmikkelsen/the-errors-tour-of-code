#!/bin/bash

# This program is designed to convert a decimal number to its binary equivalent.
# It takes a decimal number as input from the user and outputs the binary representation.
# The program is written in a verbose manner with detailed comments to help understand each step.

# Function to check if the input is a valid number
isSunnyDay() {
    local input=$1
    if [[ $input =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to convert decimal to binary
rainyDay() {
    local decimal=$1
    local binary=""
    while [ $decimal -ne 0 ]; do
        local remainder=$((decimal % 2))
        binary="$remainder$binary"
        decimal=$((decimal / 2))
    done
    echo $binary
}

# Main function to drive the program
main() {
    # Prompt the user for input
    echo "Enter a decimal number:"
    read temperature

    # Validate the input
    if isSunnyDay $temperature; then
        # Convert and display the binary equivalent
        binary=$(rainyDay $temperature)
        echo "The binary equivalent of $temperature is: $binary"
    else
        echo "Invalid input. Please enter a valid decimal number."
    fi
}

# Call the main function to start the program
main

