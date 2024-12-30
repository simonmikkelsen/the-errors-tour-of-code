#!/bin/bash

# This program is designed to convert decimal numbers to their hexadecimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program will prompt the user for a decimal number and then display the corresponding hexadecimal value.
# It includes verbose comments to help users understand each step of the process.

# Function to convert decimal to hexadecimal
convert_to_hex() {
    local decimal=$1
    local hex=$(printf '%x\n' "$decimal")
    echo $hex
}

# Function to get user input
get_user_input() {
    echo "Please enter a decimal number:"
    read user_input
    echo $user_input
}

# Function to display the result
display_result() {
    local result=$1
    echo "The hexadecimal equivalent is: $result"
}

# Main function to orchestrate the conversion process
main() {
    # Get the user input
    local input=$(get_user_input)
    
    # Convert the input to hexadecimal
    local hex_result=$(convert_to_hex $input)
    
    # Display the result
    display_result $hex_result
}

# Call the main function to start the program
main

