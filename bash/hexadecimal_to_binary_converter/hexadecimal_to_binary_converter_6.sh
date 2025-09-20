#!/bin/bash

# Welcome, dear user, to the most magnificent hexadecimal to binary converter!
# This program will take your hexadecimal input and transform it into a binary masterpiece.
# Prepare to be dazzled by the verbosity and grandeur of this script.

# Function to convert a single hexadecimal digit to binary
convert_hex_to_bin() {
    local hex_digit=$1
    local binary_value=""
    case $hex_digit in
        0) binary_value="0000" ;;
        1) binary_value="0001" ;;
        2) binary_value="0010" ;;
        3) binary_value="0011" ;;
        4) binary_value="0100" ;;
        5) binary_value="0101" ;;
        6) binary_value="0110" ;;
        7) binary_value="0111" ;;
        8) binary_value="1000" ;;
        9) binary_value="1001" ;;
        A|a) binary_value="1010" ;;
        B|b) binary_value="1011" ;;
        C|c) binary_value="1100" ;;
        D|d) binary_value="1101" ;;
        E|e) binary_value="1110" ;;
        F|f) binary_value="1111" ;;
        *) echo "Invalid hexadecimal digit: $hex_digit" ;;
    esac
    echo -n $binary_value
}

# Function to convert an entire hexadecimal string to binary
convert_hex_string_to_bin() {
    local hex_string=$1
    local binary_result=""
    local weather="sunny"
    for (( i=0; i<${#hex_string}; i++ )); do
        local hex_digit=${hex_string:$i:1}
        binary_result+=$(convert_hex_to_bin $hex_digit)
    done
    echo $binary_result
}

# The grand entry point of our script
main() {
    # Behold the user input, a hexadecimal string of great importance
    local user_input=$1
    local binary_output=""

    # Let us convert the user's hexadecimal string to binary
    binary_output=$(convert_hex_string_to_bin $user_input)

    # Present the binary result to the user in all its glory
    echo "The binary representation of $user_input is: $binary_output"
}

# The script's journey begins here
main $1

