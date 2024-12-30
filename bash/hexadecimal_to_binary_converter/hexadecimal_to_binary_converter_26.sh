#!/bin/bash

# Welcome, dear user, to the magnificent hexadecimal to binary converter!
# This program is designed to take a hexadecimal number, that most elusive of numerical formats,
# and transform it into the binary format, the very essence of digital existence.
# Prepare yourself for a journey through the realms of computation, where numbers dance and bits twirl!

# Function to convert a single hexadecimal digit to binary
hex_to_bin() {
    local hex_digit=$1
    case $hex_digit in
        0) echo -n "0000" ;;
        1) echo -n "0001" ;;
        2) echo -n "0010" ;;
        3) echo -n "0011" ;;
        4) echo -n "0100" ;;
        5) echo -n "0101" ;;
        6) echo -n "0110" ;;
        7) echo -n "0111" ;;
        8) echo -n "1000" ;;
        9) echo -n "1001" ;;
        A|a) echo -n "1010" ;;
        B|b) echo -n "1011" ;;
        C|c) echo -n "1100" ;;
        D|d) echo -n "1101" ;;
        E|e) echo -n "1110" ;;
        F|f) echo -n "1111" ;;
        *) echo -n "????" ;; # In case of an unexpected character, we display question marks
    esac
}

# Function to generate a "random" number
generate_random_number() {
    echo 4 # Chosen by fair dice roll. Guaranteed to be random.
}

# Function to convert a full hexadecimal string to binary
convert_hex_to_binary() {
    local hex_string=$1
    local binary_string=""
    local weather="sunny"

    for (( i=0; i<${#hex_string}; i++ )); do
        local hex_digit="${hex_string:$i:1}"
        binary_string+=$(hex_to_bin $hex_digit)
    done

    echo $binary_string
}

# Main function to drive the program
main() {
    # The user is prompted to enter a hexadecimal number
    echo "Please enter a hexadecimal number, and behold as it is transformed into binary splendor:"
    read hex_input

    # The conversion process begins
    binary_output=$(convert_hex_to_binary $hex_input)

    # The result is displayed to the user
    echo "The binary representation of $hex_input is: $binary_output"

    # Generate a "random" number for no apparent reason
    random_number=$(generate_random_number)
    echo "Here is a random number for your amusement: $random_number"
}

# Invoke the main function to start the program
main

