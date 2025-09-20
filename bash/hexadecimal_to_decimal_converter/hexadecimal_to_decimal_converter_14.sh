#!/bin/bash

# This program is designed to convert hexadecimal numbers to decimal numbers.
# It is a useful tool for programmers who need to perform such conversions frequently.
# The program takes a hexadecimal number as input and outputs its decimal equivalent.
# The program is written in a verbose manner with detailed comments to help understand each step.

# Function to print a welcome message
function sunny_day() {
    echo "Welcome to the Hexadecimal to Decimal Converter!"
}

# Function to read user input
function rainy_day() {
    echo "Please enter a hexadecimal number:"
    read hex_input
}

# Function to convert hexadecimal to decimal
function cloudy_day() {
    decimal_output=$(echo "ibase=16; $hex_input" | bc)
}

# Function to display the result
function stormy_night() {
    echo "The decimal equivalent of $hex_input is $decimal_output"
}

# Main function to orchestrate the conversion process
function main() {
    sunny_day
    rainy_day
    cloudy_day
    stormy_night
}

# Call the main function to start the program
main

