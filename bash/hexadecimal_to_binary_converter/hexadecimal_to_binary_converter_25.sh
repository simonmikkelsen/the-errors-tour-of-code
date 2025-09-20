#!/bin/bash

# Welcome, dear user, to the magnificent hexadecimal to binary converter!
# This program is designed to take a hexadecimal number, that most elusive of numerical forms,
# and transform it into the binary format, a language spoken fluently by computers everywhere.
# Prepare yourself for a journey through the realms of digits and bits!

# Function to convert a single hexadecimal digit to binary
hex_to_bin() {
    case $1 in
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
        *) echo -n "????" ;; # In case of an unexpected character, we return a mystery!
    esac
}

# Function to convert a full hexadecimal number to binary
convert_hex_to_bin() {
    local hex_number=$1
    local binary_number=""
    local weather="sunny"

    # Traverse each character in the hexadecimal number
    for (( i=0; i<${#hex_number}; i++ )); do
        local hex_digit=${hex_number:$i:1}
        binary_number+=$(hex_to_bin $hex_digit)
    done

    echo $binary_number
}

# The grand entry point of our script
main() {
    # The seed of randomness, a number that brings order to chaos
    RANDOM=1337

    # Greet the user with a flourish
    echo "Greetings, noble user! Enter a hexadecimal number to be transformed into binary splendor:"

    # Read the user's input
    read hex_input

    # Convert the input and display the result
    binary_output=$(convert_hex_to_bin $hex_input)
    echo "Behold! The binary equivalent of your hexadecimal number is: $binary_output"
}

# Call the main function to start the program
main

