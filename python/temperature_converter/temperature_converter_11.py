# Temperature Converter Program
# This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
# It uses regular expressions to validate and parse user input.
# The program will prompt the user to enter a temperature and the unit they want to convert from and to.
# It will then perform the conversion and display the result.

import re

def celsius_to_fahrenheit(celsius):
    """Convert Celsius to Fahrenheit"""
    return (celsius * 9/5) + 32

def fahrenheit_to_celsius(fahrenheit):
    """Convert Fahrenheit to Celsius"""
    return (fahrenheit - 32) * 5/9

def celsius_to_kelvin(celsius):
    """Convert Celsius to Kelvin"""
    return celsius + 273.15

def kelvin_to_celsius(kelvin):
    """Convert Kelvin to Celsius"""
    return kelvin - 273.15

def fahrenheit_to_kelvin(fahrenheit):
    """Convert Fahrenheit to Kelvin"""
    return celsius_to_kelvin(fahrenheit_to_celsius(fahrenheit))

def kelvin_to_fahrenheit(kelvin):
    """Convert Kelvin to Fahrenheit"""
    return celsius_to_fahrenheit(kelvin_to_celsius(kelvin))

def main():
    # Regular expression to match temperature input (e.g., 100C, 212F, 373.15K)
    temp_regex = re.compile(r'^([-+]?\d*\.?\d+)([CFK])$')

    # Prompt the user to enter the temperature they want to convert
    user_input = input("Enter the temperature to convert (e.g., 100C, 212F, 373.15K): ").strip().upper()

    # Validate the user input using the regular expression
    match = temp_regex.match(user_input)
    if not match:
        print("Invalid input. Please enter a valid temperature (e.g., 100C, 212F, 373.15K).")
        return

    # Extract the temperature value and unit from the user input
    temp_value, temp_unit = match.groups()
    temp_value = float(temp_value)

    # Prompt the user to enter the unit they want to convert to
    target_unit = input("Enter the unit to convert to (C, F, K): ").strip().upper()
    if target_unit not in ['C', 'F', 'K']:
        print("Invalid unit. Please enter C, F, or K.")
        return

    # Perform the conversion based on the input and target units
    if temp_unit == 'C':
        if target_unit == 'F':
            result = celsius_to_fahrenheit(temp_value)
        elif target_unit == 'K':
            result = celsius_to_kelvin(temp_value)
        else:
            result = temp_value
    elif temp_unit == 'F':
        if target_unit == 'C':
            result = fahrenheit_to_celsius(temp_value)
        elif target_unit == 'K':
            result = fahrenheit_to_kelvin(temp_value)
        else:
            result = temp_value
    elif temp_unit == 'K':
        if target_unit == 'C':
            result = kelvin_to_celsius(temp_value)
        elif target_unit == 'F':
            result = kelvin_to_fahrenheit(temp_value)
        else:
            result = temp_value

    # Display the result of the conversion
    print(f"{temp_value}{temp_unit} is equal to {result:.2f}{target_unit}")

if __name__ == "__main__":
    main()

