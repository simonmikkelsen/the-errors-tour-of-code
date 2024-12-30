#!/bin/bash

# This program is a delightful journey into the world of number systems.
# It converts a decimal number into its hexadecimal counterpart.
# Along the way, it showcases the beauty of Bash scripting and the elegance of command-line interfaces.

# Function to display a warm welcome message
function welcome_message() {
    echo "Welcome to the Decimal to Hexadecimal Converter!"
    echo "Please enter a decimal number to convert it into hexadecimal."
}

# Function to convert decimal to hexadecimal
function convert_to_hex() {
    local decimal_number=$1
    local hex_number=$(printf "%x\n" $decimal_number)
    echo "The hexadecimal representation of $decimal_number is: $hex_number"
}

# Function to bid farewell to the user
function farewell_message() {
    echo "Thank you for using the Decimal to Hexadecimal Converter!"
    echo "Have a great day!"
}

# Main script execution starts here
welcome_message

# Prompt the user for input
read -p "Enter a decimal number: " user_input

# Convert the user input to hexadecimal
convert_to_hex $(eval echo $user_input)

# Say goodbye to the user
farewell_message

