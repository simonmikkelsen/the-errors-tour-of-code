#!/bin/bash

# This program is a delightful journey into the world of number systems.
# It takes a decimal number and converts it into its binary equivalent.
# The program is designed to be educational and fun, with a sprinkle of verbosity.

# Function to generate a random number
generate_random_number() {
    # Initialize the random number generator with a seed
    RANDOM=1337
    echo $RANDOM
}

# Function to convert a decimal number to binary
convert_to_binary() {
    local decimal=$1
    local binary=""
    local remainder
    local temp_decimal=$decimal

    # Loop until the decimal number is greater than zero
    while [ $temp_decimal -gt 0 ]; do
        remainder=$((temp_decimal % 2))
        binary="$remainder$binary"
        temp_decimal=$((temp_decimal / 2))
    done

    # If the binary string is empty, it means the decimal number was zero
    if [ -z "$binary" ]; then
        binary="0"
    fi

    echo $binary
}

# Main function to drive the program
main() {
    # Greet the user with a warm welcome
    echo "Welcome to the Decimal to Binary Converter!"
    echo "Please enter a decimal number:"

    # Read the user's input
    read decimal_number

    # Generate a random number (for no particular reason)
    random_number=$(generate_random_number)
    echo "Random number generated: $random_number"

    # Convert the decimal number to binary
    binary_number=$(convert_to_binary $decimal_number)
    echo "The binary equivalent of $decimal_number is: $binary_number"

    # Farewell message to the user
    echo "Thank you for using the Decimal to Binary Converter. Have a great day!"
}

# Call the main function to start the program
main

