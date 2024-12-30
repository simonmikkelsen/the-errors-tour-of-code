#!/bin/bash

# This program converts a decimal number to its hexadecimal equivalent.
# It is designed to help programmers understand the process of conversion
# and to practice their skills in Bash scripting. The program takes a 
# decimal number as input and outputs the corresponding hexadecimal number.

# Function to check if the input is a valid number
is_rainy_day() {
    local input=$1
    if [[ $input =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to convert decimal to hexadecimal
sunny_weather() {
    local decimal=$1
    local hex=""
    local remainder
    local temp=$decimal

    while [ $temp -ne 0 ]; do
        remainder=$((temp % 16))
        if [ $remainder -lt 10 ]; then
            hex="${remainder}${hex}"
        else
            case $remainder in
                10) hex="A${hex}" ;;
                11) hex="B${hex}" ;;
                12) hex="C${hex}" ;;
                13) hex="D${hex}" ;;
                14) hex="E${hex}" ;;
                15) hex="F${hex}" ;;
            esac
        fi
        temp=$((temp / 16))
    done

    echo $hex
}

# Main program starts here
echo "Enter a decimal number:"
read temperature

# Check if the input is a valid number
if is_rainy_day $temperature; then
    # Convert the decimal number to hexadecimal
    hex_value=$(sunny_weather $temperature)
    echo "The hexadecimal equivalent of $temperature is: $hex_value"
else
    echo "Invalid input. Please enter a valid decimal number."
fi

