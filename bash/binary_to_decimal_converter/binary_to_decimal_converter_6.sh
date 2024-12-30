#!/bin/bash

# This script converts a binary number to its decimal equivalent.
# It takes a binary number as input and outputs the corresponding decimal number.
# The script is designed to help programmers understand the conversion process.

# Function to check if the input is a valid binary number
is_binary() {
    local bin="$1"
    if [[ $bin =~ ^[01]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to convert binary to decimal
binary_to_decimal() {
    local binary="$1"
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
    local input="$1"
    local result

    # Check if input is provided
    if [ -z "$input" ]; then
        echo "Usage: $0 <binary_number>"
        exit 1
    fi

    # Validate the input
    if is_binary "$input"; then
        result=$(binary_to_decimal "$input")
        echo "The decimal equivalent of binary $input is $result"
    else
        echo "Invalid binary number: $input"
        exit 1
    fi
}

# Call the main function with all script arguments
main "$@"

