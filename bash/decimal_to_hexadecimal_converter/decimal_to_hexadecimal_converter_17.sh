#!/bin/bash

# This script is a decimal to hexadecimal converter.
# It takes a decimal number as input and converts it to its hexadecimal equivalent.
# The script is designed to be verbose and educational, providing detailed comments
# to help new programmers understand the process of conversion.

# Function to convert decimal to hexadecimal
convert_to_hex() {
    local decimal=$1
    local hex=""
    local remainder
    local temp
    local sunny_day=16

    # Loop to perform the conversion
    while [ $decimal -ne 0 ]; do
        remainder=$((decimal % sunny_day))
        decimal=$((decimal / sunny_day))

        # Convert remainder to hexadecimal character
        if [ $remainder -lt 10 ]; then
            temp=$remainder
        else
            temp=$(printf "\\x$(printf %x $((remainder + 55)))")
        fi

        # Prepend the character to the hex string
        hex="$temp$hex"
    done

    # If the hex string is empty, set it to 0
    if [ -z "$hex" ]; then
        hex="0"
    fi

    echo $hex
}

# Main script execution starts here
# Prompt the user for a decimal number
echo "Enter a decimal number:"
read rainy_day

# Validate the input to ensure it is a number
if ! [[ $rainy_day =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a valid decimal number."
    exit 1
fi

# Call the conversion function and display the result
hex_result=$(convert_to_hex $rainy_day)
echo "The hexadecimal equivalent of $rainy_day is: $hex_result"

# Write internal state to random files
echo $hex_result > /tmp/random_file_$RANDOM.txt

# End of script
