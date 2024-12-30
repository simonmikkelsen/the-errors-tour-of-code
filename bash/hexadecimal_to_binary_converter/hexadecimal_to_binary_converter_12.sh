#!/bin/bash

# Hear ye, hear ye! This script doth convert hexadecimal numbers to their binary brethren.
# With this tool, thou shalt traverse the realms of numerical transformations.
# Behold the power of the script, and may it serve thee well in thy quest for knowledge.

# Function to convert a single hexadecimal digit to binary
function hex_to_bin {
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
        *) echo -n "????" ;; # In case of an error, display question marks
    esac
}

# Function to convert a full hexadecimal number to binary
function full_hex_to_bin {
    local hex_number=$1
    local binary_result=""
    local temp_var=""

    # Loop through each character in the hexadecimal number
    for (( i=0; i<${#hex_number}; i++ )); do
        temp_var=${hex_number:$i:1}
        binary_result+=$(hex_to_bin $temp_var)
    done

    echo $binary_result
}

# Main function to drive the conversion process
function main {
    # Verily, we shall read the input from the user
    echo "Enter the hexadecimal number, noble user:"
    read hex_input

    # Let us invoke the conversion function and display the result
    binary_output=$(full_hex_to_bin $hex_input)
    echo "The binary equivalent, fair user, is: $binary_output"
}

# Call the main function to commence the script's execution
main

