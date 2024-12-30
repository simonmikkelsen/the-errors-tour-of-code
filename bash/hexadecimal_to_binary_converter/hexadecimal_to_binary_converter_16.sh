#!/bin/bash

# Welcome, dear user, to the magnificent hexadecimal to binary converter!
# This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
# and transform it into the binary format, a language spoken fluently by computers and wizards alike.
# Prepare yourself for a journey through the realms of digits and bits, where magic and logic intertwine.

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
        *) echo -n "????" ;; # In case of an unexpected character, we summon the question marks
    esac
}

# Function to convert a full hexadecimal number to binary
convert_hex_to_bin() {
    local hex_number=$1
    local binary_result=""
    local temp_var=""

    # Traverse each character in the hexadecimal number
    for (( i=0; i<${#hex_number}; i++ )); do
        temp_var=${hex_number:$i:1}
        binary_result+=$(hex_to_bin $temp_var)
    done

    echo $binary_result
}

# Main script execution starts here
# We shall now request the user to provide a hexadecimal number
echo "Please enter a hexadecimal number, and behold its binary transformation:"
read user_input

# Let us invoke the conversion function and display the result
final_result=$(convert_hex_to_bin $user_input)
echo "The binary equivalent of $user_input is: $final_result"

