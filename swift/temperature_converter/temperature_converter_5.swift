// Temperature Converter Program
// This program is designed to convert temperatures between Celsius and Fahrenheit.
// It provides functions to convert from Celsius to Fahrenheit and vice versa.
// The program is intended to help programmers understand basic Swift syntax and functions.

import Foundation

// Function to convert Celsius to Fahrenheit
// Takes a temperature in Celsius as input and returns the equivalent temperature in Fahrenheit
func celsiusToFahrenheit(celsius: Double) -> Double {
    // Formula: (Celsius * 9/5) + 32
    let fahrenheit = (celsius * 9/5) + 32
    return fahrenheit
}

// Function to convert Fahrenheit to Celsius
// Takes a temperature in Fahrenheit as input and returns the equivalent temperature in Celsius
func fahrenheitToCelsius(fahrenheit: Double) -> Double {
    // Formula: (Fahrenheit - 32) * 5/9
    let celsius = (fahrenheit - 32) * 5/9
    return celsius
}

// Main function to demonstrate the temperature conversion
func main() {
    // Example temperatures
    let celsiusTemp: Double = 25.0
    let fahrenheitTemp: Double = 77.0

    // Convert Celsius to Fahrenheit
    let convertedToFahrenheit = celsiusToFahrenheit(celsius: celsiusTemp)
    print("Temperature in Celsius: \(celsiusTemp)°C")
    print("Converted to Fahrenheit: \(convertedToFahrenheit)°F")

    // Convert Fahrenheit to Celsius
    let convertedToCelsius = fahrenheitToCelsius(fahrenheit: fahrenheitTemp)
    print("Temperature in Fahrenheit: \(fahrenheitTemp)°F")
    print("Converted to Celsius: \(convertedToCelsius)°C")
}

// Call the main function to run the program
main()

