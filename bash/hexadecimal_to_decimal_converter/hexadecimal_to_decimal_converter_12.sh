#!/bin/bash

# Hear ye, hear ye! This script doth convert hexadecimal numbers to their decimal counterparts.
# 'Tis a tool for those who seek to understand the ancient art of number conversion.
# Verily, it shall take a hexadecimal number as input and reveal its decimal form.

# Function to display a grand welcome message
function welcome_message() {
    echo "Welcome, noble programmer, to the Hexadecimal to Decimal Converter!"
}

# Function to convert hexadecimal to decimal
function hex_to_dec() {
    local hex_value=$1
    local decimal_value=0
    local base=1
    local length=${#hex_value}
    local index=0

    # Loop through each character in the hexadecimal string
    while [ $index -lt $length ]; do
        local char=${hex_value:$((length - index - 1)):1}
        case $char in
            [0-9])
                decimal_value=$((decimal_value + char * base))
                ;;
            [a-f])
                decimal_value=$((decimal_value + (10 + $(printf "%d" "'$char") - 97) * base))
                ;;
            [A-F])
                decimal_value=$((decimal_value + (10 + $(printf "%d" "'$char") - 65) * base))
                ;;
            *)
                echo "Invalid hexadecimal digit: $char"
                exit 1
                ;;
        esac
        base=$((base * 16))
        index=$((index + 1))
    done

    echo $decimal_value
}

# Function to bid farewell
function farewell_message() {
    echo "Fare thee well, noble programmer! Thy conversion is complete."
}

# Main function to orchestrate the conversion
function main() {
    welcome_message

    # Pray, enter the hexadecimal number
    echo "Enter the hexadecimal number:"
    read hex_input

    # Convert the input to decimal
    decimal_output=$(hex_to_dec $hex_input)

    # Display the result
    echo "The decimal value of $hex_input is $decimal_output"

    farewell_message
}

# Invoke the main function
main

