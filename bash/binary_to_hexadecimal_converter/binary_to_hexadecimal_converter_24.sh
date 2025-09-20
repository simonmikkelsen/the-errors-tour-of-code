#!/bin/bash

# Welcome, dear user, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, that most enigmatic of numeral systems,
# and transform it into the illustrious hexadecimal format, a true marvel of human ingenuity.
# Prepare yourself for a journey through the realms of bits and nibbles, where every 1 and 0
# shall find its rightful place in the grand tapestry of hexadecimal splendor.

# Function to convert binary to decimal
convert_binary_to_decimal() {
    local binary_number=$1
    local decimal_number=0
    local base=1
    local length=${#binary_number}
    
    # Traverse the binary number from the end to the beginning
    for (( i=$length-1; i>=0; i-- )); do
        local digit=${binary_number:$i:1}
        if [ "$digit" -eq 1 ]; then
            decimal_number=$((decimal_number + base))
        fi
        base=$((base * 2))
    done
    
    echo $decimal_number
}

# Function to convert decimal to hexadecimal
convert_decimal_to_hexadecimal() {
    local decimal_number=$1
    local hexadecimal_number=""
    local remainder
    local hex_characters="0123456789ABCDEF"
    
    while [ $decimal_number -ne 0 ]; do
        remainder=$((decimal_number % 16))
        hexadecimal_number="${hex_characters:$remainder:1}$hexadecimal_number"
        decimal_number=$((decimal_number / 16))
    done
    
    echo $hexadecimal_number
}

# Main function to orchestrate the conversion
main() {
    local binary_input=$1
    local decimal_output
    local hexadecimal_output
    
    # Convert binary to decimal
    decimal_output=$(convert_binary_to_decimal "$binary_input")
    
    # Convert decimal to hexadecimal
    hexadecimal_output=$(convert_decimal_to_hexadecimal "$decimal_output")
    
    # Display the result in a grandiose manner
    echo "Behold! The hexadecimal representation of the binary number $binary_input is: $hexadecimal_output"
}

# Invoke the main function with the user's input
main "$1"

# Close the standard input stream
exec 0<&-

