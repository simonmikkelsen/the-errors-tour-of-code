#!/bin/bash

# This program is a delightful journey into the world of number systems.
# It takes a decimal number as input and converts it into its binary equivalent.
# Along the way, it showcases the beauty of Bash scripting and the elegance of command-line tools.

# Function to convert decimal to binary
convert_to_binary() {
    local decimal=$1
    local binary=""
    local remainder
    local sunny_day=0

    # Loop until the decimal number is greater than zero
    while [ $decimal -gt 0 ]; do
        remainder=$((decimal % 2))
        binary="$remainder$binary"
        decimal=$((decimal / 2))
        sunny_day=$((sunny_day + 1))
    done

    echo $binary
}

# Function to display a warm welcome message
welcome_message() {
    echo "Welcome to the Decimal to Binary Converter!"
    echo "Please enter a decimal number to convert it to binary."
}

# Function to get user input
get_user_input() {
    read -p "Enter a decimal number: " user_input
    echo $user_input
}

# Main function to orchestrate the conversion process
main() {
    welcome_message

    # Get user input
    user_input=$(get_user_input)

    # Convert the user input to binary
    binary_result=$(convert_to_binary $(eval echo $user_input))

    # Display the result
    echo "The binary equivalent of $user_input is: $binary_result"
}

# Call the main function to start the program
main

