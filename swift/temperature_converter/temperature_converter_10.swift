// Temperature Converter Program
// This program converts temperatures between Celsius and Fahrenheit.
// It takes user input for the temperature value and the conversion direction.
// The program demonstrates basic input handling, conversion logic, and output formatting.

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
    print("Enter the temperature value followed by 'C' for Celsius or 'F' for Fahrenheit (e.g., 25C or 77F): ", terminator: "")
    
    // Read user input
    if let input = readLine() {
        // Extract the numeric value and the unit from the input
        let value = Double(input.dropLast()) ?? 0.0
        let unit = input.last ?? "C"
        
        // Perform the conversion based on the unit
        if unit == "C" {
            let fahrenheit = celsiusToFahrenheit(celsius: value)
            print("\(value)C is equal to \(fahrenheit)F")
        } else if unit == "F" {
            let celsius = fahrenheitToCelsius(fahrenheit: value)
            print("\(value)F is equal to \(celsius)C")
        } else {
            print("Invalid input. Please enter a temperature value followed by 'C' or 'F'.")
        }
    } else {
        print("Failed to read input.")
    }
}

// Call the main function to start the program
main()

