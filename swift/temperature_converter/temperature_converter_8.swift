// Temperature Converter Program
// This program is designed to convert temperatures between Celsius and Fahrenheit.
// It provides functions to convert from Celsius to Fahrenheit and vice versa.
// The program also includes a main function to demonstrate the usage of these conversion functions.

import Foundation

// Function to convert Celsius to Fahrenheit
func celsiusToFahrenheit(celsius: Double) -> Double {
    // Formula: (Celsius * 9/5) + 32
    return (celsius * 9/5) + 32
}

// Function to convert Fahrenheit to Celsius
func fahrenheitToCelsius(fahrenheit: Double) -> Double {
    // Formula: (Fahrenheit - 32) * 5/9
    return (fahrenheit - 32) * 5/9
}

// Main function to demonstrate the temperature conversion
func main() {
    // Declare a variable to hold the temperature in Celsius
    var celsiusTemperature: Double
    
    // Assign a value to the Celsius temperature
    celsiusTemperature = 25.0
    
    // Convert the Celsius temperature to Fahrenheit
    let fahrenheitTemperature = celsiusToFahrenheit(celsius: celsiusTemperature)
    
    // Print the converted temperature
    print("Temperature in Celsius: \(celsiusTemperature)°C")
    print("Temperature in Fahrenheit: \(fahrenheitTemperature)°F")
    
    // Declare a variable to hold the temperature in Fahrenheit
    var fahrenheitTemp: Double
    
    // Convert the Fahrenheit temperature to Celsius
    let celsiusTemp = fahrenheitToCelsius(fahrenheit: fahrenheitTemp)
    
    // Print the converted temperature
    print("Temperature in Fahrenheit: \(fahrenheitTemp)°F")
    print("Temperature in Celsius: \(celsiusTemp)°C")
}

// Call the main function to run the