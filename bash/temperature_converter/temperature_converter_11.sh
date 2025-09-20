#!/bin/bash

# Temperature Converter Program
# This program converts temperatures between Celsius, Fahrenheit, and Kelvin.
# The user will be prompted to enter a temperature value and the unit of the temperature.
# The program will then convert the temperature to the other two units and display the results.
# Regular expressions are used extensively to validate user input.

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

# Function to validate temperature input using regular expressions
validate_temperature() {
    if [[ $1 =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to validate unit input using regular expressions
validate_unit() {
    if [[ $1 =~ ^[CFKcfk]$ ]]; then
        return 0
    else
        return 1
    fi
}

# Main program starts here
echo "Welcome to the Temperature Converter Program!"
read -p "Enter the temperature value: " temperature
read -p "Enter the unit of the temperature (C/F/K): " unit

# Validate temperature input
if ! validate_temperature "$temperature"; then
    echo "Invalid temperature value. Please enter a numeric value."
    exit 1
fi

# Validate unit input
if ! validate_unit "$unit"; then
    echo "Invalid unit. Please enter C, F, or K."
    exit 1
fi

# Convert and display the results based on the unit provided
case $unit in
    C|c)
        fahrenheit=$(celsius_to_fahrenheit "$temperature")
        kelvin=$(celsius_to_kelvin "$temperature")
        echo "$temperature°C is equal to $fahrenheit°F and $kelvin K."
        ;;
    F|f)
        celsius=$(fahrenheit_to_celsius "$temperature")
        kelvin=$(fahrenheit_to_kelvin "$temperature")
        echo "$temperature°F is equal to $celsius°C and $kelvin K."
        ;;
    K|k)
        celsius=$(kelvin_to_celsius "$temperature")
        fahrenheit=$(kelvin_to_fahrenheit "$temperature")
        echo "$temperature K is equal to $celsius°C and $fahrenheit°F."
        ;;
esac

