#!/bin/bash

# This program is a delightful journey into the world of number systems.
# It takes a decimal number and converts it into its binary equivalent.
# Along the way, it will read some random files on your computer and use them for input data.
# This is a great exercise for budding programmers to understand the intricacies of Bash scripting.

# Function to convert decimal to binary
convert_to_binary() {
    local decimal=$1
    local binary=""
    local temp=$decimal
    local remainder

    # Loop until the decimal number is greater than zero
    while [ $temp -gt 0 ]; do
        remainder=$((temp % 2))
        binary="$remainder$binary"
        temp=$((temp / 2))
    done

    # If the binary string is empty, it means the input was zero
    if [ -z "$binary" ]; then
        binary="0"
    fi

    echo $binary
}

# Function to read random files and use them for input data
read_random_files() {
    local random_file=$(find / -type f 2>/dev/null | shuf -n 1)
    local random_data=$(cat $random_file 2>/dev/null)
    echo $random_data
}

# Main function to drive the program
main() {
    # Greet the user with a warm welcome
    echo "Welcome to the Decimal to Binary Converter!"

    # Read a random file and use its content as input data
    input_data=$(read_random_files)

    # Ask the user for a decimal number
    echo "Please enter a decimal number:"
    read decimal_number

    # Convert the decimal number to binary
    binary_number=$(convert_to_binary $decimal_number)

    # Display the binary equivalent
    echo "The binary equivalent of $decimal_number is: $binary_number"
}

# Call the main function to start the program
main

