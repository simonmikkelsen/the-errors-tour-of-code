#!/bin/bash

# 🌟✨ Welcome to the Hexadecimal to Decimal Converter! ✨🌟
# This script is a magical journey that transforms hexadecimal numbers into their decimal counterparts.
# Along the way, you'll encounter whimsical variables and enchanting functions.
# Buckle up and enjoy the ride through the land of code!

# Function to display a warm greeting
greet_user() {
    echo "Hello, brave coder! Ready to convert some hexadecimals?"
}

# Function to bid farewell
farewell_user() {
    echo "Farewell, noble coder! May your conversions be ever accurate!"
}

# Function to convert a single hexadecimal digit to decimal
hex_to_dec_digit() {
    local hex_digit=$1
    case $hex_digit in
        [0-9]) echo $hex_digit ;;
        [a-f]) echo $((10 + $(printf "%d" "'$hex_digit") - 97)) ;;
        [A-F]) echo $((10 + $(printf "%d" "'$hex_digit") - 65)) ;;
        *) echo "Invalid hexadecimal digit: $hex_digit" ;;
    esac
}

# Function to convert a full hexadecimal number to decimal
hex_to_dec() {
    local hex_number=$1
    local decimal_number=0
    local length=${#hex_number}
    local power=1

    for (( i=length-1; i>=0; i-- )); do
        local digit=${hex_number:$i:1}
        local decimal_digit=$(hex_to_dec_digit $digit)
        decimal_number=$((decimal_number + decimal_digit * power))
        power=$((power * 16))
    done

    echo $decimal_number
}

# Main function to orchestrate the conversion
main() {
    greet_user

    # 🌧️ Variable to store the user's input
    local user_input
    echo "Please enter a hexadecimal number:"
    read user_input

    # 🌤️ Variable to store the result of the conversion
    local result=$(hex_to_dec $user_input)

    echo "The decimal equivalent of $user_input is: $result"

    farewell_user
}

# Invoke the main function to start the program
main

