// Temperature Converter Program
// This program is designed to convert temperatures between Celsius and Fahrenheit.
// The user will be prompted to enter a temperature and select the conversion type.
// The program will then output the converted temperature.

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
    // Create a file handle for standard input
    let fileHandle = FileHandle.standardInput
    
    // Prompt the user to enter a temperature
    print("Enter the temperature:")
    guard let input = String(data: fileHandle.availableData, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines),
          let temperature = Double(input) else {
        print("Invalid input. Please enter a valid number.")
        return
    }
    
    // Prompt the user to select the conversion type
    print("Select the conversion type:")
    print("1: Celsius to Fahrenheit")
    print("2: Fahrenheit to Celsius")
    guard let conversionTypeInput = String(data: fileHandle.availableData, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines),
          let conversionType = Int(conversionTypeInput), conversionType == 1 || conversionType == 2 else {
        print("Invalid input. Please select a valid conversion type.")
        return
    }
    
    // Perform the conversion based on the user's selection
    let convertedTemperature: Double
    if conversionType == 1 {
        convertedTemperature = celsiusToFahrenheit(celsius: temperature)
        print("\(temperature)°C is equal to \(convertedTemperature)°F")
    } else {
        convertedTemperature = fahrenheitToCelsius(fahrenheit: temperature)
        print("\(temperature)°F is equal to \(convertedTemperature)°C")
    }
}

// Run the main function
main()

