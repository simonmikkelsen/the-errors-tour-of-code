#!/bin/bash

# This program is a decimal to hexadecimal converter.
# It takes a decimal number as input and converts it to its hexadecimal equivalent.
# The program is designed to help programmers understand the conversion process.
# It also demonstrates the use of various Bash programming constructs.

# Function to convert decimal to hexadecimal
convert_to_hex() {
    local decimal=$1
    local hex=""
    local remainder
    local temp

    # Loop to perform the conversion
    while [ $decimal -ne 0 ]; do
        remainder=$((decimal % 16))
        decimal=$((decimal / 16))

        # Convert remainder to hexadecimal digit
        if [ $remainder -lt 10 ]; then
            temp=$(printf "%d" $remainder)
        else
            temp=$(printf "%x" $remainder)
        fi

        # Prepend the hexadecimal digit to the result
        hex="$temp$hex"
    done

    echo $hex
}

# Main program starts here
# Prompt the user for input
echo "Enter a decimal number:"
read input

# Call the conversion function
result=$(convert_to_hex $input)

# Display the result
echo "The hexadecimal equivalent is: $result"

# End of the program
