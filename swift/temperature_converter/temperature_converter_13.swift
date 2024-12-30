// Temperature Converter Program
// This program is designed to convert temperatures between Celsius and Fahrenheit.
// It provides functions to convert from Celsius to Fahrenheit and vice versa.
// The program uses global variables to store the temperature values for conversion.

import Foundation

// Global variable to store the temperature value
var temperature: Double = 0.0

// Function to convert Celsius to Fahrenheit
func celsiusToFahrenheit() -> Double {
    // Formula: (Celsius * 9/5) + 32
    return (temperature * 9/5) + 32
}

// Function to convert Fahrenheit to Celsius
func fahrenheitToCelsius() -> Double {
    // Formula: (Fahrenheit - 32) * 5/9
    return (temperature - 32) * 5/9
}

// Main function to demonstrate the temperature conversion
func main() {
    // Set the temperature to a value in Celsius
    temperature = 25.0
    print("Temperature in Celsius: \(temperature)")
    print("Temperature in Fahrenheit: \(celsiusToFahrenheit())")
    
    // Set the temperature to a value in Fahrenheit
    temperature = 77.0
    print("Temperature in Fahrenheit: \(temperature)")
    print("Temperature in Celsius: \(fahrenheitToCelsius())")
}

// Call the main function to run the program
main()

