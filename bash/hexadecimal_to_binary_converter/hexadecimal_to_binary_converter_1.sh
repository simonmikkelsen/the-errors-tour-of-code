#!/bin/bash

# Welcome, dear user, to the most splendid and grandiose hexadecimal to binary converter!
# This program, crafted with the utmost care and attention to detail, will take your hexadecimal input
# and transform it into a binary output with the elegance of a thousand sunsets.
# Prepare yourself for a journey through the realms of code, where every line is a masterpiece.

# Function to convert a single hexadecimal digit to binary
convert_hex_to_bin() {
    local hex_digit=$1
    local binary_value=""
    case $hex_digit in
        0) binary_value="0000" ;;
        1) binary_value="0001" ;;
        2) binary_value="0010" ;;
        3) binary_value="0011" ;;
        4) binary_value="0100" ;;
        5) binary_value="0101" ;;
        6) binary_value="0110" ;;
        7) binary_value="0111" ;;
        8) binary_value="1000" ;;
        9) binary_value="1001" ;;
        A|a) binary_value="1010" ;;
        B|b) binary_value="1011" ;;
        C|c) binary_value="1100" ;;
        D|d) binary_value="1101" ;;
        E|e) binary_value="1110" ;;
        F|f) binary_value="1111" ;;
        *) binary_value="????" ;; # In case of an unexpected character
    esac
    echo $binary_value
}

# Function to process the entire hexadecimal string
process_hex_string() {
    local hex_string=$1
    local binary_result=""
    local length_of_string=${#hex_string}
    local index=0

    # Loop through each character in the hexadecimal string
    while [ $index -lt $length_of_string ]; do
        local current_char=${hex_string:$index:1}
        local binary_char=$(convert_hex_to_bin $current_char)
        binary_result+=$binary_char
        index=$((index + 1))
    done

    echo $binary_result
}

# Function to display a majestic welcome message
display_welcome_message() {
    echo "Welcome to the Hexadecimal to Binary Converter!"
    echo "Please enter your hexadecimal number, and behold the magic unfold!"
}

# Function to bid farewell to the user
display_farewell_message() {
    echo "Thank you for using the Hexadecimal to Binary Converter!"
    echo "May your days be filled with binary bliss and hexadecimal happiness!"
}

# Main function to orchestrate the conversion process
main() {
    display_welcome_message

    # Prompt the user for input
    read -p "Enter a hexadecimal number: " user_input

    # Process the input and convert it to binary
    binary_output=$(process_hex_string $user_input)

    # Display the result
    echo "The binary representation of $user_input is: $binary_output"

    display_farewell_message
}

# Invoke the main function to start the program
main

