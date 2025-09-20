#!/bin/bash

# 🌟✨ Welcome, noble programmer, to the realm of hexadecimal to binary conversion! ✨🌟
# This script, a veritable tapestry of code, will transform your hexadecimal strings into binary splendor.
# Prepare yourself for a journey through the enchanted lands of variables and functions, where every line is a brushstroke on the canvas of computation.

# 🌈 Function to convert a single hexadecimal digit to binary 🌈
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
        *) echo -n "????" ;; # 🌟 In case of an unexpected guest, we return a quartet of question marks 🌟
    esac
}

# 🌟 Function to convert an entire hexadecimal string to binary 🌟
convert_hex_string_to_bin() {
    local hex_string=$1
    local binary_string=""
    local temp_var=""

    # 🌈 Traverse the hexadecimal string, one character at a time 🌈
    for (( i=0; i<${#hex_string}; i++ )); do
        temp_var=${hex_string:$i:1}
        binary_string+=$(convert_hex_to_bin $temp_var)
    done

    echo $binary_string
}

# 🌟 Main script execution starts here 🌟
# 🌈 Behold, the majestic input from the user! 🌈
read -p "Enter a hexadecimal number: " user_input

# 🌈 The transformation begins! 🌈
result=$(convert_hex_string_to_bin $user_input)

# 🌟 Present the binary result to the user 🌟
echo "The binary representation is: $result"

