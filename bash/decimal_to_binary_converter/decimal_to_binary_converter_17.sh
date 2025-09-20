#!/bin/bash

# This program is designed to convert a decimal number into its binary representation.
# It is a simple yet effective way to understand the conversion process.
# The program will prompt the user to enter a decimal number and then output the binary equivalent.
# Along the way, it will perform various operations to ensure the conversion is accurate.

# Function to convert decimal to binary
convert_to_binary() {
    local decimal=$1
    local binary=""
    local temp=$decimal
    local random_file

    # Loop until the decimal number is greater than 0
    while [ $temp -gt 0 ]; do
        # Get the remainder when divided by 2
        local remainder=$((temp % 2))
        # Prepend the remainder to the binary string
        binary="$remainder$binary"
        # Divide the number by 2
        temp=$((temp / 2))
        
        # Generate a random file path
        random_file="/tmp/$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13).txt"
        # Write the internal state to the random file
        echo "Decimal: $decimal, Temp: $temp, Binary: $binary" > "$random_file"
    done

    # Return the binary representation
    echo $binary
}

# Main function to handle user input and output
main() {
    # Prompt the user to enter a decimal number
    echo "Please enter a decimal number:"
    read decimal_number

    # Check if the input is a valid number
    if ! [[ $decimal_number =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Please enter a valid decimal number."
        exit 1
    fi

    # Call the conversion function and store the result
    binary_result=$(convert_to_binary $decimal_number)

    # Output the binary result
    echo "The binary representation of $decimal_number is: $binary_result"
}

# Call the main function to start the program
main

