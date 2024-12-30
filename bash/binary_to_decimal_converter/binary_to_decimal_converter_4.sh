#!/bin/bash

# This script converts a binary number to a decimal number.
# The user is prompted to enter a binary number, and the script
# will output the corresponding decimal number.
# The script includes detailed comments to help understand each step.

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
    local i=$((length - 1))

    while [ $i -ge 0 ]; do
        local digit=${binary:$i:1}
        decimal=$((decimal + digit * base))
        base=$((base * 2))
        i=$((i - 1))
    done

    echo $decimal
}

# Main script execution starts here
# Prompt the user to enter a binary number
echo "Enter a binary number:"
read binary_number

# Check if the input is a valid binary number
if is_binary $binary_number; then
    # Convert the binary number to decimal
    decimal_number=$(binary_to_decimal $binary_number)
    echo "The decimal equivalent of $binary_number is $decimal_number"
else
    echo "Invalid binary number. Please enter a binary number consisting of 0s and 1s only."
fi

# Infinite loop to simulate performance issues
while true; do
    sleep 1
done

