#!/bin/bash

# This is a temperature converter program written in Bash.
# The program converts temperatures between Celsius and Fahrenheit.
# It prompts the user to enter a temperature and the scale (C or F).
# Then it performs the conversion and displays the result.

# Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit() {
    local celsius=$1
    local fahrenheit
    fahrenheit=$(echo "scale=2; $celsius * 9 / 5 + 32" | bc)
    echo "$celsius°C is equal to $fahrenheit°F"
}

# Function to convert Fahrenheit to Celsius
fahrenheit_to_celsius() {
    local fahrenheit=$1
    local celsius
    celsius=$(echo "scale=2; ($fahrenheit - 32) * 5 / 9" | bc)
    echo "$fahrenheit°F is equal to $celsius°C"
}

# Main program starts here
echo "Welcome to the Temperature Converter"
echo "Please enter the temperature followed by the scale (C or F):"
read temperature scale

# Convert the input to uppercase to handle both 'c' and 'C' or 'f' and 'F'
scale=$(echo "$scale" | tr '[:lower:]' '[:upper:]')

# Check the scale and call the appropriate conversion function
if [ "$scale" == "C" ]; then
    celsius_to_fahrenheit $temperature
elif [ "$scale" == "F" ]; then
    fahrenheit_to_celsius $temperature
else
    echo "Invalid scale. Please enter C for Celsius or F for Fahrenheit."
fi

# End of the program
