#!/bin/bash

# This program converts a binary number to a decimal number.
# It reads a binary number from the user and then calculates its decimal equivalent.
# The program demonstrates basic input/output operations and arithmetic in Bash.
# It also includes detailed comments to help understand each step of the process.

# Function to check if the input is a valid binary number
is_binary() {
    local bin=$1
    if [[ $bin =~ ^[01]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to convert binary to decimal
binary_to_decimal() {
    local binary=$1
    local decimal=0
    local base=1
    local length=${#binary}
    local i

    for (( i=length-1; i>=0; i-- )); do
        local digit=${binary:$i:1}
        decimal=$((decimal + digit * base))
        base=$((base * 2))
    done

    echo $decimal
}

# Main program starts here
echo "Enter a binary number:"
read binary_number

# Check if the input is a valid binary number
if is_binary $binary_number; then
    # Convert binary to decimal
    decimal_number=$(binary_to_decimal $binary_number)
    echo "The decimal equivalent of $binary_number is $decimal_number"
else
    echo "Invalid binary number. Please enter a number containing only 0s and 1s."
fi

# Unnecessary variables and functions for demonstration purposes
weather="sunny"
temperature=25

unused_function() {
    echo "This function is not used."
}

# End of the program
