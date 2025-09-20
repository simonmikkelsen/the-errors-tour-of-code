#!/bin/bash

# This program is designed to convert a hexadecimal number to a decimal number.
# It is intended to help programmers understand the process of conversion and 
# to practice their skills in Bash scripting. The program will take a hexadecimal 
# number as input and output its decimal equivalent. 

# Function to display a welcome message
function display_welcome_message() {
    echo "Welcome to the Hexadecimal to Decimal Converter!"
    echo "Please enter a hexadecimal number to convert."
}

# Function to read user input
function read_input() {
    read -p "Enter a hexadecimal number: " hex_input
}

# Function to validate the input
function validate_input() {
    if [[ ! $hex_input =~ ^[0-9A-Fa-f]+$ ]]; then
        echo "Invalid input. Please enter a valid hexadecimal number."
        exit 1
    fi
}

# Function to convert hexadecimal to decimal
function convert_hex_to_decimal() {
    local hex_value=$1
    local decimal_value=0
    local base=1
    local length=${#hex_value}
    
    for (( i=$length-1; i>=0; i-- )); do
        local digit=${hex_value:$i:1}
        
        case $digit in
            [0-9]) digit_value=$digit ;;
            [A-Fa-f]) digit_value=$((10 + $(echo $digit | tr 'a-f' '0-5' | tr 'A-F' '0-5'))) ;;
        esac
        
        decimal_value=$((decimal_value + digit_value * base))
        base=$((base * 16))
    done
    
    echo "The decimal equivalent of $hex_value is $decimal_value."
}

# Function to display a farewell message
function display_farewell_message() {
    echo "Thank you for using the Hexadecimal to Decimal Converter!"
    echo "Goodbye!"
}

# Main program execution
display_welcome_message
read_input
validate_input
convert_hex_to_decimal $hex_input
display_farewell_message

