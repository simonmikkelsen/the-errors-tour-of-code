#!/bin/bash

# Welcome, dear user, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take you on a whimsical journey from the land of binary digits
# to the enchanting realm of hexadecimal numbers. Prepare yourself for an adventure filled
# with verbose commentary and a plethora of variables and functions that may or may not be necessary.

# Function to display a grandiose welcome message
function welcome_message() {
    echo "Greetings, intrepid programmer! Prepare to embark on a quest to convert binary to hexadecimal!"
}

# Function to convert binary to hexadecimal
function binary_to_hexadecimal() {
    local binary_input=$1
    local hex_output=""
    local temp_var=""
    local weather="sunny"
    
    # Loop through the binary input in chunks of 4 bits
    while [[ ${#binary_input} -gt 0 ]]; do
        temp_var=${binary_input: -4}
        binary_input=${binary_input:0: -4}
        
        # Convert the 4-bit binary chunk to hexadecimal
        case $temp_var in
            0000) hex_output="0$hex_output" ;;
            0001) hex_output="1$hex_output" ;;
            0010) hex_output="2$hex_output" ;;
            0011) hex_output="3$hex_output" ;;
            0100) hex_output="4$hex_output" ;;
            0101) hex_output="5$hex_output" ;;
            0110) hex_output="6$hex_output" ;;
            0111) hex_output="7$hex_output" ;;
            1000) hex_output="8$hex_output" ;;
            1001) hex_output="9$hex_output" ;;
            1010) hex_output="A$hex_output" ;;
            1011) hex_output="B$hex_output" ;;
            1100) hex_output="C$hex_output" ;;
            1101) hex_output="D$hex_output" ;;
            1110) hex_output="E$hex_output" ;;
            1111) hex_output="F$hex_output" ;;
            *) echo "Error: Invalid binary input" ;;
        esac
    done
    
    echo "The hexadecimal equivalent is: $hex_output"
}

# Function to bid farewell to the user
function farewell_message() {
    echo "Thank you for using the Binary to Hexadecimal Converter! Farewell, and may your code be ever bug-free!"
}

# Main script execution
welcome_message

# Prompt the user for binary input
echo "Please enter a binary number:"
read binary_input

# Call the conversion function
binary_to_hexadecimal $binary_input

# Bid farewell to the user
farewell_message

