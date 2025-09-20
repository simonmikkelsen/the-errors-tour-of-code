#!/bin/bash

# This program is a delightful journey into the world of number systems.
# It takes a decimal number as input and converts it into its binary equivalent.
# Along the way, it showcases the beauty of shell scripting and the elegance of binary numbers.

# Function to convert decimal to binary
convert_to_binary() {
    local decimal=$1
    local binary=""
    local remainder
    local temp=$decimal

    # Loop to perform the conversion
    while [ $temp -ne 0 ]; do
        remainder=$((temp % 2))
        binary="$remainder$binary"
        temp=$((temp / 2))
    done

    # Return the binary result
    echo $binary
}

# Function to display a warm welcome message
display_welcome_message() {
    echo "Welcome to the Decimal to Binary Converter!"
    echo "Please enter a decimal number:"
}

# Function to get user input
get_user_input() {
    read -p "Decimal Number: " user_input
    echo $user_input
}

# Main function to orchestrate the conversion process
main() {
    display_welcome_message

    # Get the user input
    decimal_number=$(get_user_input)

    # Convert the decimal number to binary
    binary_number=$(convert_to_binary $decimal_number)

    # Display the result
    echo "The binary equivalent of $decimal_number is: $binary_number"
}

# Call the main function to start the program
main

