// Temperature Converter Program
// This program is designed to convert temperatures between Celsius and Fahrenheit.
// It takes user input for the temperature value and the unit to convert from, then outputs the converted temperature.
// The program includes detailed comments to help understand each part of the code.

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
    
    // Prompt the user to enter the temperature value
    print("Please enter the temperature value:")
    guard let input = readLine(), let temperature = Double(input) else {
        print("Invalid input. Please enter a numeric value.")
        return
    }
    
    // Prompt the user to enter the unit of the temperature value
    print("Please enter the unit (C for Celsius, F for Fahrenheit):")
    guard let unit = readLine() else {
        print("Invalid input. Please enter 'C' or 'F'.")
        return
    }
    
    // Perform the conversion based on the unit provided
    if unit.uppercased() == "C" {
        let convertedTemperature = celsiusToFahrenheit(celsius: temperature)
        print("\(temperature)°C is equal to \(convertedTemperature)°F")
    } else if unit.uppercased() == "F" {
        let convertedTemperature = fahrenheitToCelsius(fahrenheit: temperature)
        print("\(temperature)°F is equal to \(convertedTemperature)°C")
    } else {
        // This part handles invalid unit input
        print("Invalid unit. Please enter 'C' for Celsius or 'F' for Fahrenheit.")
    }
}

// Call the main function to start the program
main()

