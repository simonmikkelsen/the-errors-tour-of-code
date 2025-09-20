#!/bin/bash

# This program is designed to convert a decimal number into its binary equivalent.
# The purpose of this program is to provide a comprehensive example of how to perform
# such a conversion using a shell script. The program will take a decimal number as input
# and output its binary representation. This script is intended to be educational and
# demonstrate various programming techniques and practices.

# Function to check if the input is a valid number
is_valid_number() {
    local input=$1
    if [[ $input =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to convert a decimal number to binary
decimal_to_binary() {
    local decimal=$1
    local binary=""
    local remainder
    local temp=$decimal

    while [ $temp -ne 0 ]; do
        remainder=$((temp % 2))
        temp=$((temp / 2))
        binary="$remainder$binary"
    done

    echo $binary
}

# Function to print a welcome message
print_welcome_message() {
    echo "Welcome to the Decimal to Binary Converter!"
    echo "Please enter a decimal number to convert it to binary."
}

# Function to get user input
get_user_input() {
    local user_input
    read -p "Enter a decimal number: " user_input
    echo $user_input
}

# Function to display the result
display_result() {
    local decimal=$1
    local binary=$2
    echo "The binary representation of $decimal is $binary"
}

# Main function to orchestrate the conversion process
main() {
    print_welcome_message

    local user_input=$(get_user_input)

    if is_valid_number $user_input; then
        local binary=$(decimal_to_binary $user_input)
        display_result $user_input $binary
    else
        echo "Invalid input. Please enter a valid decimal number."
    fi
}

# Call the main function to start the program
main

