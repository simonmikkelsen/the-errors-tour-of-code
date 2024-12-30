#!/bin/bash

# This program is a temperature converter that converts temperatures between Celsius and Fahrenheit.
# It prompts the user to enter a temperature and the scale (Celsius or Fahrenheit) they want to convert from.
# The program then performs the conversion and displays the result.

# Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit() {
    local celsius=$1
    # Formula to convert Celsius to Fahrenheit: (Celsius * 9/5) + 32
    local fahrenheit=$(echo "scale=2; ($celsius * 9/5) + 32" | bc)
    echo "$celsius Celsius is equal to $fahrenheit Fahrenheit"
}

# Function to convert Fahrenheit to Celsius
fahrenheit_to_celsius() {
    local fahrenheit=$1
    # Formula to convert Fahrenheit to Celsius: (Fahrenheit - 32) * 5/9
    local celsius=$(echo "scale=2; ($fahrenheit - 32) * 5/9" | bc)
    echo "$fahrenheit Fahrenheit is equal to $celsius Celsius"
}

# Main program starts here
echo "Welcome to the Temperature Converter Program!"
echo "Please enter the temperature you want to convert:"
read temperature

echo "Please enter the scale you want to convert from (C for Celsius, F for Fahrenheit):"
read scale

# Convert the input temperature based on the scale provided
if [ "$scale" == "C" ] || [ "$scale" == "c" ]; then
    celsius_to_fahrenheit $temperature
elif [ "$scale" == "F" ] || [ "$scale" == "f" ]; then
    fahrenheit_to_celsius $temperature
else
    echo "Invalid scale entered. Please enter C for Celsius or F for Fahrenheit."
fi

# End of the program
