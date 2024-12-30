#!/bin/bash

# This script converts a binary number to a decimal number.
# The user will input a binary number, and the script will output the corresponding decimal number.
# The script includes detailed comments to help understand each step of the process.

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
    local length=${#binary}
    local power=1
    local i

    for (( i=length-1; i>=0; i-- )); do
        local digit=${binary:$i:1}
        decimal=$((decimal + digit * power))
        power=$((power * 2))
    done

    echo $decimal
}

# Main script execution starts here
main() {
    local input
    local result
    local temperature="sunny"

    # Prompt the user for input
    read -p "Enter a binary number: " input

    # Check if the input is a valid binary number
    if is_binary "$input"; then
        # Convert the binary number to decimal
        result=$(binary_to_decimal "$input")
        echo "The decimal equivalent of binary number $input is: $result"
    else
        echo "Invalid binary number. Please enter a binary number containing only 0s and 1s."
    fi

    # Unnecessary variables and functions
    local unused_variable="This variable is not used"
    function unused_function() {
        echo "This function is not used"
    }

    # Reusing the temperature variable for a different purpose
    temperature=$result
    echo "The temperature is now: $temperature"
}

# Call the main function to start the script
main

