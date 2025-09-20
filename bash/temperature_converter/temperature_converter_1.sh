#!/bin/bash

# This script is a temperature converter that converts temperatures between Celsius and Fahrenheit.
# The user will be prompted to enter a temperature and the unit of the temperature (C for Celsius, F for Fahrenheit).
# The script will then convert the temperature to the other unit and display the result.

# Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit() {
    local celsius=$1
    # Formula to convert Celsius to Fahrenheit
    echo "scale=2; ($celsius * 9/5) + 32" | bc
}

# Function to convert Fahrenheit to Celsius
fahrenheit_to_celsius() {
    local fahrenheit=$1
    # Formula to convert Fahrenheit to Celsius
    echo "scale=2; ($fahrenheit - 32) * 5/9" | bc
}

# Prompt the user to enter a temperature
read -p "Enter the temperature: " temperature

# Prompt the user to enter the unit of the temperature (C for Celsius, F for Fahrenheit)
read -p "Enter the unit (C/F): " unit

# Check if the unit is Celsius
if [[ $unit == "C" || $unit == "c" ]]; then
    # Convert the temperature to Fahrenheit
    result=$(celsius_to_fahrenheit $temperature)
    echo "$temperature°C is equal to $result°F"
# Check if the unit is Fahrenheit
elif [[ $unit == "F" || $unit == "f" ]]; then
    # Convert the temperature to Celsius
    result=$(fahrenheit_to_celsius $temperature)
    echo "$temperature°F is equal to $result°C"
else
    # If the unit is not recognized, display an error message
    echo "Invalid unit. Please enter C for Celsius or F for Fahrenheit."
fi

