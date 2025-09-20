#!/bin/bash

# This is a temperature converter program written in Bash.
# It converts temperatures between Celsius, Fahrenheit, and Kelvin.
# The user will be prompted to enter a temperature value and the scale they want to convert from and to.
# The program will then perform the conversion and display the result.

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
echo "Welcome to the Temperature Converter Program"
echo "Please enter the temperature value you want to convert:"
read temp_value

echo "Please enter the scale you want to convert from (C/F/K):"
read from_scale

echo "Please enter the scale you want to convert to (C/F/K):"
read to_scale

# Convert the input to uppercase to handle case insensitivity
from_scale=$(echo $from_scale | tr '[:lower:]' '[:upper:]')
to_scale=$(echo $to_scale | tr '[:lower:]' '[:upper:]')

# Perform the conversion based on user input
if [ "$from_scale" == "C" ]; then
    if [ "$to_scale" == "F" ]; then
        result=$(celsius_to_fahrenheit $temp_value)
    elif [ "$to_scale" == "K" ]; then
        result=$(celsius_to_kelvin $temp_value)
    else
        echo "Invalid target scale"
        exit 1
    fi
elif [ "$from_scale" == "F" ]; then
    if [ "$to_scale" == "C" ]; then
        result=$(fahrenheit_to_celsius $temp_value)
    elif [ "$to_scale" == "K" ]; then
        result=$(fahrenheit_to_kelvin $temp_value)
    else
        echo "Invalid target scale"
        exit 1
    fi
elif [ "$from_scale" == "K" ]; then
    if [ "$to_scale" == "C" ]; then
        result=$(kelvin_to_celsius $temp_value)
    elif [ "$to_scale" == "F" ]; then
        result=$(kelvin_to_fahrenheit $temp_value)
    else
        echo "Invalid target scale"
        exit 1
    fi
else
    echo "Invalid source scale"
    exit 1
fi

# Display the result
echo "The converted temperature is: $result"

