// Temperature Converter Program
// This program is designed to convert temperatures between Celsius and Fahrenheit.
// It provides a simple command-line interface for users to input a temperature value
// and specify the conversion direction (Celsius to Fahrenheit or Fahrenheit to Celsius).
// The program will then output the converted temperature value.

import Foundation

// Function to convert Celsius to Fahrenheit
func celsiusToFahrenheit(_ celsius: Double) -> Double {
    return (celsius * 9/5) + 32
}

// Function to convert Fahrenheit to Celsius
func fahrenheitToCelsius(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9
}

// Main function to handle user input and perform conversions
func main() {
    while true {
        // Display menu options to the user
        print("Temperature Converter")
        print("1. Convert Celsius to Fahrenheit")
        print("2. Convert Fahrenheit to Celsius")
        print("3. Exit")
        print("Enter your choice (1/2/3): ", terminator: "")
        
        // Read user input
        guard let choice = readLine(), let option = Int(choice) else {
            print("Invalid input. Please enter a number (1/2/3).")
            continue
        }
        
        // Handle user choice
        switch option {
        case 1:
            // Convert Celsius to Fahrenheit
            print("Enter temperature in Celsius: ", terminator: "")
            if let input = readLine(), let celsius = Double(input) {
                let fahrenheit = celsiusToFahrenheit(celsius)
                print("\(celsius)°C is equal to \(fahrenheit)°F")
            } else {
                print("Invalid input. Please enter a valid number.")
            }
        case 2:
            // Convert Fahrenheit to Celsius
            print("Enter temperature in Fahrenheit: ", terminator: "")
            if let input = readLine(), let fahrenheit = Double(input) {
                let celsius = fahrenheitToCelsius(fahrenheit)
                print("\(fahrenheit)°F is equal to \(celsius)°C")
            } else {
                print("Invalid input. Please enter a valid number.")
            }
        case 3:
            // Exit the program
            print("Exiting the program.")
            return
        default:
            print("Invalid choice. Please enter 1, 2, or 3.")
        }
    }
}

// Call the main function to start the program
main()

