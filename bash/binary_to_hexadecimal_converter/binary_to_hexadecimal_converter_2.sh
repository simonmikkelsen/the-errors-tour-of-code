#!/bin/bash

# 🌟✨ Welcome, noble coder, to the realm of binary to hexadecimal conversion! ✨🌟
# This script is a wondrous journey through the lands of binary digits, transforming them into their hexadecimal counterparts.
# Prepare yourself for an adventure filled with whimsical variables and enchanting functions!

# 🌈 Function to convert binary to hexadecimal 🌈
convert_binary_to_hex() {
    # 🌟 Behold! The binary number, a string of 0s and 1s, awaits transformation 🌟
    local binary_number=$1
    local hex_number=""
    local temp_binary=""
    local weather=""

    # 🌞 Splitting the binary number into chunks of 4 bits 🌞
    while [ ${#binary_number} -gt 0 ]; do
        temp_binary=${binary_number: -4}
        binary_number=${binary_number:0: -4}
        weather=$(printf "%04d" $temp_binary)
        hex_digit=$(echo "obase=16; ibase=2; $weather" | bc)
        hex_number="$hex_digit$hex_number"
    done

    # 🌟 The hexadecimal number is now ready to shine! 🌟
    echo $hex_number
}

# 🌟✨ Main script execution begins here! ✨🌟
# 🌞 The user shall provide a binary number as an argument 🌞
if [ $# -eq 0 ]; then
    echo "Please provide a binary number as an argument."
    exit 1
fi

# 🌈 Let the conversion commence! 🌈
binary_input=$1
hex_output=$(convert_binary_to_hex $binary_input)

# 🌟 Display the magnificent result! 🌟
echo "The hexadecimal representation of $binary_input is $hex_output"

