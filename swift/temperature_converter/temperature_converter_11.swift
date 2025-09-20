// Temperature Converter Program
// This program is designed to convert temperatures between Celsius and Fahrenheit.
// It uses regular expressions to validate the input format and ensure that the user
// enters a valid temperature value. The program will prompt the user to enter a temperature
// and then ask for the desired conversion (Celsius to Fahrenheit or Fahrenheit to Celsius).
// The result will be displayed to the user.

import Foundation

// Function to convert Celsius to Fahrenheit
func celsiusToFahrenheit(_ celsius: Double) -> Double {
    return (celsius * 9/5) + 32
}

// Function to convert Fahrenheit to Celsius
func fahrenheitToCelsius(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9
}

// Function to validate the input using regular expressions
func isValidTemperature(_ input: String) -> Bool {
    let regex = try! NSRegularExpression(pattern: "^[+-]?\\d+(\\.\\d+)?$", options: [])
    let range = NSRange(location: 0, length: input.utf16.count)
    return regex.firstMatch(in: input, options: [], range: range) != nil
}

// Main program execution
print("Enter the temperature value:")
if let input = readLine(), isValidTemperature(input) {
    if let temperature = Double(input) {
        print("Enter the conversion type (C for Celsius to Fahrenheit, F for Fahrenheit to Celsius):")
        if let conversionType = readLine() {
            if conversionType.uppercased() == "C" {
                let result = celsiusToFahrenheit(temperature)
                print("\(temperature)°C is equal to \(result)°F")
            } else if conversionType.uppercased() == "F" {
                let result = fahrenheitToCelsius(temperature)
                print("\(temperature)°F is equal to \(result)°C")
            } else {
                print("Invalid conversion type. Please enter 'C' or 'F'.")
            }
        }
    } else {
        print("Invalid temperature value.")
    }
} else {
    print("Invalid input format. Please enter a valid temperature value.")
}

