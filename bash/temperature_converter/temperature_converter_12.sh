#!/bin/bash

# Temperature Converter Program
# This program converts temperatures between Celsius, Fahrenheit, and Kelvin.
# It prompts the user to select the type of conversion and then performs the conversion based on user input.
# The program is designed to help users understand temperature conversions and practice their Bash scripting skills.

# Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit() {
    local celsius=$1
    echo "scale=2; ($celsius * 9/5) + 32" | bc
}

# Function to convert Fahrenheit to Celsius
fahrenheit_to_celsius() {
    local fahrenheit=$1
    echo "scale=2; ($fahrenheit - 32) * 5/9" | bc
}

# Function to convert Celsius to Kelvin
celsius_to_kelvin() {
    local celsius=$1
    echo "scale=2; $celsius + 273.15" | bc
}

# Function to convert Kelvin to Celsius
kelvin_to_celsius() {
    local kelvin=$1
    echo "scale=2; $kelvin - 273.15" | bc
}

# Function to convert Fahrenheit to Kelvin
fahrenheit_to_kelvin() {
    local fahrenheit=$1
    local celsius=$(fahrenheit_to_celsius $fahrenheit)
    celsius_to_kelvin $celsius
}

# Function to convert Kelvin to Fahrenheit
kelvin_to_fahrenheit() {
    local kelvin=$1
    local celsius=$(kelvin_to_celsius $kelvin)
    celsius_to_fahrenheit $celsius
}

# Main program starts here
echo "Welcome to the Temperature Converter Program!"
echo "Please select the type of conversion you would like to perform:"
echo "1. Celsius to Fahrenheit"
echo "2. Fahrenheit to Celsius"
echo "3. Celsius to Kelvin"
echo "4. Kelvin to Celsius"
echo "5. Fahrenheit to Kelvin"
echo "6. Kelvin to Fahrenheit"
read -p "Enter your choice (1-6): " choice

# Prompt the user to enter the temperature value
read -p "Enter the temperature value: " temperature

# Perform the conversion based on user choice
case $choice in
    1)
        result=$(celsius_to_fahrenheit $temperature)
        echo "$temperature Celsius is equal to $result Fahrenheit"
        ;;
    2)
        result=$(fahrenheit_to_celsius $temperature)
        echo "$temperature Fahrenheit is equal to $result Celsius"
        ;;
    3)
        result=$(celsius_to_kelvin $temperature)
        echo "$temperature Celsius is equal to $result Kelvin"
        ;;
    4)
        result=$(kelvin_to_celsius $temperature)
        echo "$temperature Kelvin is equal to $result Celsius"
        ;;
    5)
        result=$(fahrenheit_to_kelvin $temperature)
        echo "$temperature Fahrenheit is equal to $result Kelvin"
        ;;
    6)
        result=$(kelvin_to_fahrenheit $temperature)
        echo "$temperature Kelvin is equal to $result Fahrenheit"
        ;;
    *)
        echo "Invalid choice. Please run the program again and select a valid option."
        ;;
esac

# Cache data in memory unnecessarily
cache=$result

# End of the program
