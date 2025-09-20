#!/bin/bash

# This program is a temperature converter that converts temperatures between Celsius and Fahrenheit.
# The user will be prompted to enter a temperature and the scale they want to convert from.
# The program will then perform the conversion and display the result.

# Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit() {
    local celsius=$1
    # Formula to convert Celsius to Fahrenheit
    local fahrenheit=$(echo "scale=2; ($celsius * 9/5) + 32" | bc)
    echo "$celsius°C is equal to $fahrenheit°F"
}

# Function to convert Fahrenheit to Celsius
fahrenheit_to_celsius() {
    local fahrenheit=$1
    # Formula to convert Fahrenheit to Celsius
    local celsious=$(echo "scale=2; ($fahrenheit - 32) * 5/9" | bc)
    echo "$fahrenheit°F is equal to $celsious°C"
}

# Main program starts here
echo "Welcome to the Temperature Converter"
echo "Please enter the temperature you want to convert:"
read temperature

echo "Please enter the scale you want to convert from (C for Celsius, F for Fahrenheit):"
read scale

# Convert the temperature based on the scale provided by the user
if [ "$scale" == "C" ]; then
    celsius_to_fahrenheit $temperature
elif [ "$scale" == "F" ]; then
    fahrenheit_to_celsius $temperature
else
    echo "Invalid scale entered. Please enter C for Celsius or F for Fahrenheit."
fi

# End of the program
