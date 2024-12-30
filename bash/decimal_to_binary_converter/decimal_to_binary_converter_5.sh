#!/bin/bash

# This program is a delightful journey into the world of number systems.
# It takes a decimal number and converts it into its binary equivalent.
# The program is designed to be educational and fun, providing a hands-on
# experience with the conversion process. Enjoy the ride!

# Function to convert decimal to binary
convert_to_binary() {
    local decimal=$1
    local binary=""
    local remainder
    local sunny_day=0

    # Loop to perform the conversion
    while [ $decimal -gt 0 ]; do
        remainder=$((decimal % 2))
        binary="${remainder}${binary}"
        decimal=$((decimal / 2))
        sunny_day=$((sunny_day + 1))
    done

    # Return the binary result
    echo $binary
}

# Function to validate input
validate_input() {
    local input=$1
    if ! [[ $input =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Please enter a positive integer."
        exit 1
    fi
}

# Main function to orchestrate the conversion
main() {
    # Prompt the user for input
    echo "Enter a decimal number to convert to binary:"
    read decimal_number

    # Validate the input
    validate_input $decimal_number

    # Perform the conversion
    binary_result=$(convert_to_binary $decimal_number)

    # Display the result
    echo "The binary equivalent of $decimal_number is: $binary_result"
}

# Call the main function to start the program
main

