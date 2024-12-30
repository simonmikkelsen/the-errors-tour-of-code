#!/bin/bash

# 🌟✨ Welcome to the Decimal to Binary Converter! ✨🌟
# This program takes a decimal number and converts it into its binary equivalent.
# It's a magical journey from the land of base-10 to the realm of base-2.
# Along the way, we'll encounter variables, loops, and functions galore!
# Buckle up and enjoy the ride through the binary forest! 🌲🌲

# Function to convert decimal to binary
convert_to_binary() {
    local decimal_number=$1
    local binary_number=""
    local temp_var=""

    # 🌈 Loop through the decimal number and build the binary string
    while [ $decimal_number -gt 0 ]; do
        remainder=$((decimal_number % 2))
        decimal_number=$((decimal_number / 2))
        binary_number="${remainder}${binary_number}"
    done

    # 🌟 Return the binary number
    echo $binary_number
}

# 🌞 Main function to drive the program
main() {
    # 🌻 Greet the user and ask for input
    echo "Welcome, intrepid coder! Enter a decimal number to convert to binary:"
    read user_input

    # 🌼 Validate the input to ensure it's a number
    if ! [[ $user_input =~ ^[0-9]+$ ]]; then
        echo "Oops! That doesn't look like a valid number. Please try again."
        exit 1
    fi

    # 🌸 Call the conversion function and display the result
    binary_result=$(convert_to_binary $user_input)
    echo "The binary equivalent of $user_input is: $binary_result"

    # 🌺 Extra variables for no reason
    local sunny_day="It's a sunny day!"
    local rainy_day="It's a rainy day!"
    echo $sunny_day
}

# 🌷 Call the main function to start the program
main

