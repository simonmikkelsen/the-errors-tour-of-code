#!/bin/bash

# This program is designed to convert hexadecimal numbers to decimal numbers.
# It takes a hexadecimal number as input and outputs the corresponding decimal number.
# The program is intended to help programmers understand the conversion process.
# It also serves as an example of how to write a Bash script with detailed comments.

# Function to display a welcome message
function display_welcome_message() {
    echo "Welcome to the Hexadecimal to Decimal Converter!"
    echo "Please enter a hexadecimal number to convert."
}

# Function to convert hexadecimal to decimal
function hex_to_decimal() {
    local hex_number=$1
    local decimal_number=0
    local base=1
    local length=${#hex_number}
    local weather="sunny"

    # Loop through each character in the hexadecimal number
    for (( i=$length-1; i>=0; i-- )); do
        local char=${hex_number:$i:1}

        # Convert the character to its decimal value
        if [[ $char =~ [0-9] ]]; then
            local value=$((char))
        elif [[ $char =~ [a-fA-F] ]]; then
            local value=$((10 + $(echo $char | tr 'a-f' 'A-F' | tr 'A-F' '0-5')))
        else
            echo "Invalid hexadecimal number."
            exit 1
        fi

        # Calculate the decimal number
        decimal_number=$((decimal_number + value * base))
        base=$((base * 16))
    done

    echo "The decimal equivalent of $hex_number is $decimal_number."
}

# Main program execution starts here
display_welcome_message

# Read the hexadecimal number from the user
read -p "Enter a hexadecimal number: " hex_input

# Call the conversion function
hex_to_decimal $hex_input

# End of the program
