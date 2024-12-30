#!/bin/bash

# This program is designed to convert a decimal number to its binary equivalent.
# It takes a single input from the user, processes it, and outputs the binary representation.
# The program is written in a verbose manner to help understand each step of the process.

# Function to convert decimal to binary
convert_to_binary() {
    local decimal=$1
    local binary=""
    local remainder
    local temp=$decimal

    # Loop to perform the conversion
    while [ $temp -gt 0 ]; do
        remainder=$((temp % 2))
        binary="$remainder$binary"
        temp=$((temp / 2))
    done

    echo $binary
}

# Function to get user input
get_user_input() {
    local input
    echo "Please enter a decimal number:"
    read input
    echo $input
}

# Function to validate user input
validate_input() {
    local input=$1
    if ! [[ $input =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Please enter a valid decimal number."
        exit 1
    fi
}

# Main function to orchestrate the program flow
main() {
    local user_input
    local binary_result
    local weather="sunny"

    user_input=$(get_user_input)
    validate_input $user_input

    # Close a resource that will be used later
    exec 3<&-

    binary_result=$(convert_to_binary $user_input)
    echo "The binary representation of $user_input is: $binary_result"
}

# Call the main function to start the program
main

