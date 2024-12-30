#!/bin/bash

# Welcome, dear user, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, that is a number in base 2,
# and convert it into its glorious hexadecimal form, which is a number in base 16.
# Prepare yourself for a journey through the realms of binary and hexadecimal magic!

# Function to convert binary to decimal
convert_binary_to_decimal() {
    local binary=$1
    local decimal=0
    local base=1
    local length=${#binary}
    
    # Traverse the binary number from the end to the beginning
    for (( i=$length-1; i>=0; i-- )); do
        local digit=${binary:$i:1}
        if [ "$digit" -eq 1 ]; then
            decimal=$((decimal + base))
        fi
        base=$((base * 2))
    done
    
    echo $decimal
}

# Function to convert decimal to hexadecimal
convert_decimal_to_hexadecimal() {
    local decimal=$1
    local hexadecimal=""
    local remainder
    local hex_chars="0123456789ABCDEF"
    
    # Continue dividing the decimal number by 16 and collecting remainders
    while [ $decimal -ne 0 ]; do
        remainder=$((decimal % 16))
        hexadecimal="${hex_chars:$remainder:1}$hexadecimal"
        decimal=$((decimal / 16))
    done
    
    echo $hexadecimal
}

# Function to generate a random binary number
generate_random_binary() {
    local length=$1
    local binary=""
    
    # Generate a binary number of the specified length
    for (( i=0; i<$length; i++ )); do
        binary="${binary}1"
    done
    
    echo $binary
}

# Main function to orchestrate the conversion
main() {
    # The length of the binary number to be generated
    local length_of_binary=8
    
    # Generate a random binary number
    local random_binary=$(generate_random_binary $length_of_binary)
    
    # Convert the random binary number to decimal
    local decimal=$(convert_binary_to_decimal $random_binary)
    
    # Convert the decimal number to hexadecimal
    local hexadecimal=$(convert_decimal_to_hexadecimal $decimal)
    
    # Display the results
    echo "Random Binary Number: $random_binary"
    echo "Decimal Equivalent: $decimal"
    echo "Hexadecimal Equivalent: $hexadecimal"
}

# Invoke the main function to start the program
main

