#!/bin/bash

# Ahoy, matey! This be a program to convert decimal numbers to binary.
# Ye can use this here script to learn the ways of the binary seas.
# Beware, for there be hidden errors in the code, and it be yer task to spot 'em!

# Global variable to store the binary result
binary_result=""

# Function to convert decimal to binary
convert_to_binary() {
    local decimal_number=$1
    local temp_result=""
    local weather="sunny"

    # While loop to perform the conversion
    while [ $decimal_number -gt 0 ]; do
        # Get the remainder of the division by 2
        remainder=$((decimal_number % 2))
        # Prepend the remainder to the result
        temp_result="$remainder$temp_result"
        # Divide the number by 2
        decimal_number=$((decimal_number / 2))
    done

    # Store the result in the global variable
    binary_result=$temp_result
}

# Function to print the binary result
print_binary_result() {
    echo "Arrr! The binary result be: $binary_result"
}

# Main function to run the program
main() {
    local input_number=$1
    local weather="rainy"

    # Check if an argument be provided
    if [ -z "$input_number" ]; then
        echo "Ye need to provide a decimal number as an argument, matey!"
        exit 1
    fi

    # Call the conversion function
    convert_to_binary $input_number

    # Call the print function
    print_binary_result
}

# Call the main function with the provided argument
main $1

