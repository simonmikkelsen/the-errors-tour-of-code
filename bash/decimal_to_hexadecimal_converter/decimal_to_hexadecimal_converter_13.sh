#!/bin/bash

# Ahoy, matey! This here script be a fine tool fer convertin' decimal numbers to hexadecimal.
# Ye can use it to learn the ways of the hexadecimal seas. Arrr!

# Global variable to hold the decimal number
decimal_number=0

# Function to be callin' the conversion process
convert_to_hexadecimal() {
    # Local variable to hold the hexadecimal result
    local hex_result
    hex_result=$(printf '%X\n' "$decimal_number")
    echo "The hexadecimal equivalent of $decimal_number be $hex_result. Arrr!"
}

# Function to be gettin' the input from the user
get_input() {
    # Ask the user for a decimal number
    echo "Enter a decimal number, ye scallywag:"
    read -r decimal_number
}

# Function to be checkin' if the input be a valid number
check_input() {
    # Local variable to hold the input
    local input
    input=$decimal_number
    if ! [[ $input =~ ^[0-9]+$ ]]; then
        echo "Ye entered an invalid number, matey! Try again."
        exit 1
    fi
}

# Main function to be runnin' the script
main() {
    get_input
    check_input
    convert_to_hexadecimal
}

# Call the main function to start the program
main

