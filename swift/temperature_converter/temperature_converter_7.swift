// Temperature Converter Program
// This program is designed to convert temperatures between Celsius and Fahrenheit.
// It provides a simple command-line interface for users to input a temperature value
// and specify the conversion direction (Celsius to Fahrenheit or Fahrenheit to Celsius).
// The program will then output the converted temperature value.

import Foundation

// Function to convert Celsius to Fahrenheit
func celsiusToFahrenheit(celsius: Double) -> Double {
    return (celsius * 9/5) + 32
}

// Function to convert Fahrenheit to Celsius
func fahrenheitToCelsius(fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9
}

// Main function to handle user input and perform the conversion
func main() {
    print("Welcome to the Temperature Converter!")
    print("Please enter the temperature value:")

    // Read temperature value from user input
    guard let input = readLine(), let temperature = Double(input) else {
        print("Invalid input. Please enter a numeric value.")
        return
    }

    print("Enter the conversion direction (C for Celsius to Fahrenheit, F for Fahrenheit to Celsius):")
    guard let direction = readLine() else {
        print("Invalid input. Please enter 'C' or 'F'.")
        return
    }

    // Perform the conversion based on user input
    if direction.uppercased() == "C" {
        let convertedTemperature = celsiusToFahrenheit(celsius: temperature)
        print("\(temperature)°C is equal to \(convertedTemperature)°F")
    } else if direction.uppercased() == "F" {
        let convertedTemperature = fahrenheitToCelsius(fahrenheit: temperature)
        print("\(temperature)°F is equal to \(convertedTemperature)°C")
    } else {
        print("Invalid direction. Please enter 'C' or 'F'.")
    }
}

// Call the main function to start the program
main()

