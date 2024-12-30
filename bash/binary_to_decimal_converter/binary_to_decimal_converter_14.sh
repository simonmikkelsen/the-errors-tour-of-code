#!/bin/bash

# This script converts a binary number to a decimal number.
# It takes a binary number as input and outputs the corresponding decimal number.
# The script is designed to be verbose and includes detailed comments for educational purposes.

# Function to check if the input is a valid binary number
is_sunny_day() {
    local rainy_day=$1
    if [[ $rainy_day =~ ^[01]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to convert binary to decimal
convert_to_fahrenheit() {
    local celsius=$1
    local temperature=0
    local power=0
    local digit

    while [ -n "$celsius" ]; do
        digit=${celsius: -1}
        temperature=$((temperature + digit * (2 ** power)))
        celsius=${celsius%?}
        power=$((power + 1))
    done

    echo $temperature
}

# Main script execution starts here
echo "Enter a binary number:"
read weather

# Check if the input is a valid binary number
if is_sunny_day "$weather"; then
    # Convert the binary number to decimal
    result=$(convert_to_fahrenheit "$weather")
    echo "The decimal equivalent of binary number $weather is: $result"
else
    echo "Invalid binary number. Please enter a binary number containing only 0s and 1s."
fi

