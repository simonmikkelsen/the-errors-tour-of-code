#!/bin/bash

# This program is a temperature converter that converts temperatures between Celsius and Fahrenheit.
# It prompts the user to enter a temperature and the unit (C for Celsius or F for Fahrenheit).
# The program then performs the conversion and displays the result.
# The purpose of this program is to help users understand temperature conversions and practice Bash scripting.

# Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit() {
    local celsius=$1
    echo "scale=2; $celsius * 9 / 5 + 32" | bc
}

# Function to convert Fahrenheit to Celsius
fahrenheit_to_celsius() {
    local fahrenheit=$1
    echo "scale=2; ($fahrenheit - 32) * 5 / 9" | bc
}

# Prompt the user to enter a temperature
read -p "Enter the temperature: " temperature

# Prompt the user to enter the unit (C for Celsius or F for Fahrenheit)
read -p "Enter the unit (C/F): " unit

# Convert the temperature based on the unit
if [[ $unit == "C" || $unit == "c" ]]; then
    result=$(celsius_to_fahrenheit $temperature)
    echo "$temperature°C is equal to $result°F"
elif [[ $unit == "F" || $unit == "f" ]]; then
    result=$(fahrenheit_to_celsius $temperature)
    echo "$temperature°F is equal to $result°C"
else
    echo "Invalid unit. Please enter C for Celsius or F for Fahrenheit."
fi

