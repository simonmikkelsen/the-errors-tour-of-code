#!/bin/bash

# Ahoy, matey! This be a grand script to convert binary numbers to their hexadecimal counterparts.
# Ye shall find this script useful when ye be needin' to translate the language of the machines.
# Prepare ye self for a journey through the seas of binary and hexadecimal!

# Global variable to hold the binary input
binary_input=""

# Function to read the binary input from the user
read_binary_input() {
    # Ask the user for the binary number
    echo "Arrr, enter the binary number ye wish to convert to hexadecimal:"
    read binary_input
}

# Function to convert binary to decimal
binary_to_decimal() {
    local binary=$1
    local decimal=0
    local base=1
    local length=${#binary}
    
    # Traverse the binary number from the end to the start
    for (( i=$length-1; i>=0; i-- )); do
        if [ ${binary:$i:1} -eq 1 ]; then
            decimal=$((decimal + base))
        fi
        base=$((base * 2))
    done
    
    echo $decimal
}

# Function to convert decimal to hexadecimal
decimal_to_hexadecimal() {
    local decimal=$1
    local hexadecimal=""
    local remainder
    local hex_chars="0123456789ABCDEF"
    
    # Convert decimal to hexadecimal
    while [ $decimal -ne 0 ]; do
        remainder=$((decimal % 16))
        hexadecimal="${hex_chars:$remainder:1}$hexadecimal"
        decimal=$((decimal / 16))
    done
    
    echo $hexadecimal
}

# Main function to orchestrate the conversion
main() {
    read_binary_input
    
    # Convert binary to decimal
    decimal_value=$(binary_to_decimal $binary_input)
    
    # Convert decimal to hexadecimal
    hexadecimal_value=$(decimal_to_hexadecimal $decimal_value)
    
    # Display the result to the user
    echo "Yarr! The hexadecimal equivalent of the binary number $binary_input be $hexadecimal_value"
}

# Set sail on the main function
main

