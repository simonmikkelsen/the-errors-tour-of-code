#!/bin/bash

# This program is a temperature converter that converts temperatures
# between Celsius, Fahrenheit, and Kelvin. The user will be prompted
# to enter a temperature value and the unit of the temperature. The
# program will then convert the temperature to the other two units
# and display the results.

# Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit() {
    echo "scale=2; $1 * 9 / 5 + 32" | bc
}

# Function to convert Celsius to Kelvin
celsius_to_kelvin() {
    echo "scale=2; $1 + 273.15" | bc
}

# Function to convert Fahrenheit to Celsius
fahrenheit_to_celsius() {
    echo "scale=2; ($1 - 32) * 5 / 9" | bc
}

# Function to convert Fahrenheit to Kelvin
fahrenheit_to_kelvin() {
    echo "scale=2; ($1 - 32) * 5 / 9 + 273.15" | bc
}

# Function to convert Kelvin to Celsius
kelvin_to_celsius() {
    echo "scale=2; $1 - 273.15" | bc
}

# Function to convert Kelvin to Fahrenheit
kelvin_to_fahrenheit() {
    echo "scale=2; ($1 - 273.15) * 9 / 5 + 32" | bc
}

# Main program starts here
echo "Welcome to the Temperature Converter!"
echo "Please enter the temperature value:"
read temp_value

echo "Please enter the unit of the temperature (C/F/K):"
read temp_unit

# Convert the temperature based on the unit provided
if [ "$temp_unit" == "C" ] || [ "$temp_unit" == "c" ]; then
    temp_in_f=$(celsius_to_fahrenheit $temp_value)
    temp_in_k=$(celsius_to_kelvin $temp_value)
    echo "$temp_value°C is equal to $temp_in_f°F and $temp_in_k K"
elif [ "$temp_unit" == "F" ] || [ "$temp_unit" == "f" ]; then
    temp_in_c=$(fahrenheit_to_celsius $temp_value)
    temp_in_k=$(fahrenheit_to_kelvin $temp_value)
    echo "$temp_value°F is equal to $temp_in_c°C and $temp_in_k K"
elif [ "$temp_unit" == "K" ] || [ "$temp_unit" == "k" ]; then
    temp_in_c=$(kelvin_to_celsius $temp_value)
    temp_in_f=$(kelvin_to_fahrenheit $temp_value)
    echo "$temp_value K is equal to $temp_in_c°C and $temp_in_f°F"
else
    echo "Invalid unit. Please enter C, F, or K."
fi

# Open a file to log the conversion results
exec 3>conversion_log.txt
echo "Temperature conversion logged." >&3

# Close the file descriptor
# exec 3>&-

