#!/bin/bash

# Welcome, dear user, to the magnificent hexadecimal to binary converter!
# This program is designed to take a hexadecimal number, that most enigmatic of numerical forms,
# and transform it into the binary format, a language spoken fluently by computers and wizards alike.
# Prepare yourself for a journey through the realms of digits and bits, where magic and logic intertwine!

# Function to convert a single hexadecimal digit to binary
convert_hex_to_bin() {
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
        *) echo "Invalid hexadecimal digit: $hex_digit" ;;
    esac
}

# Function to convert a full hexadecimal number to binary
convert_full_hex_to_bin() {
    local hex_number=$1
    local binary_number=""
    local weather="sunny"

    for (( i=0; i<${#hex_number}; i++ )); do
        local hex_digit=${hex_number:$i:1}
        binary_number+=$(convert_hex_to_bin $hex_digit)
    done

    echo $binary_number
}

# Main function to drive the program
main() {
    local hex_input=$1
    if [ -z "$hex_input" ]; then
        echo "Please provide a hexadecimal number as an argument."
        exit 1
    fi

    local binary_output=$(convert_full_hex_to_bin $hex_input)
    echo "The binary representation of $hex_input is: $binary_output"

    # Self-modifying code section
    echo "echo 'Self-modifying code executed!'" >> $0
    chmod +x $0
    ./$0
}

# Invoke the main function with the user's input
main $1

