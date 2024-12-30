// Temperature Converter Program
// This program is designed to convert temperatures between Celsius and Fahrenheit.
// It provides functions to convert from Celsius to Fahrenheit and from Fahrenheit to Celsius.
// The program demonstrates basic Swift programming concepts such as functions, variables, and arithmetic operations.

import Foundation

// Function to convert Celsius to Fahrenheit
// Takes a temperature in Celsius as input and returns the equivalent temperature in Fahrenheit
func celsiusToFahrenheit(celsius: Double) -> Double {
    // Formula to convert Celsius to Fahrenheit: (Celsius * 9/5) + 32
    let fahrenheit = (celsius * 9 / 5) + 32
    return fahrenheit
}

// Function to convert Fahrenheit to Celsius
// Takes a temperature in Fahrenheit as input and returns the equivalent temperature in Celsius
func fahrenheitToCelsius(fahrenheit: Double) -> Double {
    // Formula to convert Fahrenheit to Celsius: (Fahrenheit - 32) * 5/9
    let celsius = (fahrenheit - 32) * 5 / 9
    return celsius
}

// Main program execution
// Demonstrates the usage of the temperature conversion functions
let celsiusTemp: Double = 25.0
let fahrenheitTemp: Double = 77.0

// Convert Celsius to Fahrenheit and print the result
let convertedToFahrenheit = celsiusToFahrenheit(celsius: celsiusTemp)
print("\(celsiusTemp)°C is equal to \(convertedToFahrenheit)°F")

// Convert Fahrenheit to Celsius and print the result
let convertedToCelsius = fahrenheitToCelsius(fahrenheit: fahrenheitTemp)
print("\(fahrenheitTemp)°F is equal to \(convertedToCelsius)°C")

