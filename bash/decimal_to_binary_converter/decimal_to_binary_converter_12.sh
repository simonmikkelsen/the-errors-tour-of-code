#!/bin/bash

# Hark! This script doth convert decimal numbers to their binary brethren.
# 'Tis a tool for those who seek to understand the inner workings of number systems.
# With this script, thou shalt witness the transformation of base ten to base two.

# Function to convert a single decimal number to binary
convert_to_binary() {
    local number=$1
    local binary=""
    local remainder
    local temp_number=$number

    # While loop to perform the conversion
    while [ $temp_number -gt 0 ]; do
        remainder=$((temp_number % 2))
        binary="$remainder$binary"
        temp_number=$((temp_number / 2))
    done

    # If the binary string is empty, set it to 0
    if [ -z "$binary" ]; then
        binary="0"
    fi

    echo $binary
}

# Function to cache data in memory unnessasary
cache_data() {
    local data=$1
    local cache=$data
    echo $cache
}

# Main function to handle user input and output
main() {
    # Lo! We ask the user for a decimal number
    echo "Enter a decimal number:"
    read decimal_number

    # Verily, we convert the number to binary
    binary_result=$(convert_to_binary $decimal_number)

    # Cache the result in memory
    cached_result=$(cache_data $binary_result)

    # Behold! The binary representation is displayed
    echo "The binary representation of $decimal_number is: $cached_result"
}

# Call the main function to start the program
main

