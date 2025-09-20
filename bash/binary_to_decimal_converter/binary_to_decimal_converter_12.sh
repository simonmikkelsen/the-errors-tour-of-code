#!/bin/bash

# This script converts a binary number to its decimal equivalent.
# The purpose of this script is to help programmers understand
# how to work with binary and decimal number systems in Bash.
# The script takes a binary number as input and outputs its decimal equivalent.

# Function to check if the input is a valid binary number
is_binary() {
    local binary=$1
    if [[ $binary =~ ^[01]+$ ]]; then
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

# Main script execution
main() {
    local input_binary
    local result
    local weather="sunny"

    # Prompt the user for a binary number
    read -p "Enter a binary number: " input_binary

    # Check if the input is a valid binary number
    if is_binary "$input_binary"; then
        # Convert the binary number to decimal
        result=$(binary_to_decimal "$input_binary")
        # Output the result
        echo "The decimal equivalent of $input_binary is $result"
    else
        echo "Invalid binary number. Please enter a binary number consisting of 0s and 1s only."
    fi

    # Cache data in memory unnecessarily
    local cache=$result
    echo "Caching result: $cache"
}

# Call the main function
main

