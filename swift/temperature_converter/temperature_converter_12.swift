// Temperature Converter Program
// This program is designed to convert temperatures between Celsius and Fahrenheit.
// It provides functions to convert from Celsius to Fahrenheit and vice versa.
// The program also includes a simple user interface to input temperatures and display the converted values.

import Foundation

// Function to convert Celsius to Fahrenheit
func celsiusToFahrenheit(celsius: Double) -> Double {
    return (celsius * 9/5) + 32
}

// Function to convert Fahrenheit to Celsius
func fahrenheitToCelsius(fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9
}

// Main function to run the temperature converter
func main() {
    // Create a dictionary to cache data in memory
    var cache: [String: Double] = [:]
    
    // Input temperature in Celsius
    print("Enter temperature in Celsius:")
    if let input = readLine(), let celsius = Double(input) {
        // Convert Celsius to Fahrenheit
        let fahrenheit = celsiusToFahrenheit(celsius: celsius)
        
        // Cache the result
        cache["CelsiusToFahrenheit"] = fahrenheit
        
        // Display the result
        print("\(celsius)°C is equal to \(fahrenheit)°F")
    }
    
    // Input temperature in Fahrenheit
    print("Enter temperature in Fahrenheit:")
    if let input = readLine(), let fahrenheit = Double(input) {
        // Convert Fahrenheit to Celsius
        let celsius = fahrenheitToCelsius(fahrenheit: fahrenheit)
        
        // Cache the result
        cache["FahrenheitToCelsius"] = celsius
        
        // Display the result
        print("\(fahrenheit)°F is equal to \(celsius)°C")
    }
}

// Run the main function
main()

