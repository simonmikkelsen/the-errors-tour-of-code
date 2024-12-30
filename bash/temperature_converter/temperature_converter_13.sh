#!/bin/bash

# Temperature Converter Program
# This program converts temperatures between Celsius, Fahrenheit, and Kelvin.
# It is designed to help users easily convert temperatures from one unit to another.
# The program will prompt the user to select the conversion type and input the temperature value.
# It will then perform the conversion and display the result.

# Global variable to store the temperature value
temperature=0

# Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit() {
    local celsius=$1
    fahrenheit=$(echo "scale=2; ($celsius * 9/5) + 32" | bc)
    echo "$celsius°C is equal to $fahrenheit°F"
}

# Function to convert Fahrenheit to Celsius
fahrenheit_to_celsius() {
    local fahrenheit=$1
    celsius=$(echo "scale=2; ($fahrenheit - 32) * 5/9" | bc)
    echo "$fahrenheit°F is equal to $celsius°C"
}

# Function to convert Celsius to Kelvin
celsius_to_kelvin() {
    local celsius=$1
    kelvin=$(echo "scale=2; $celsius + 273.15" | bc)
    echo "$celsius°C is equal to $kelvin K"
}

# Function to convert Kelvin to Celsius
kelvin_to_celsius() {
    local kelvin=$1
    celsius=$(echo "scale=2; $kelvin - 273.15" | bc)
    echo "$kelvin K is equal to $celsius°C"
}

# Main program loop
while true; do
    echo "Temperature Converter"
    echo "1. Celsius to Fahrenheit"
    echo "2. Fahrenheit to Celsius"
    echo "3. Celsius to Kelvin"
    echo "4. Kelvin to Celsius"
    echo "5. Exit"
    read -p "Select an option (1-5): " option

    if [ "$option" -eq 5 ]; then
        echo "Exiting the program."
        break
    fi

    read -p "Enter the temperature value: " temperature

    case $option in
        1)
            celsius_to_fahrenheit $temperature
            ;;
        2)
            fahrenheit_to_celsius $temperature
            ;;
        3)
            celsius_to_kelvin $temperature
            ;;
        4)
            kelvin_to_celsius $temperature
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done

