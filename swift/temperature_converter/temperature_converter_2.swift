// Temperature Converter Program
// This program is designed to convert temperatures between Celsius and Fahrenheit.
// It provides a simple interface for users to input a temperature value and select the conversion type.
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
    // Create an optional string to hold user input
    var input: String?
    
    // Prompt the user to enter a temperature value
    print("Enter the temperature value:")
    input = readLine()
    
    // Check if the input is not nil and can be converted to a Double
    if let tempString = input, let temperature = Double(tempString) {
        // Prompt the user to select the conversion type
        print("Select the conversion type:")
        print("1: Celsius to Fahrenheit")
        print("2: Fahrenheit to Celsius")
        
        // Read the conversion type from the user
        input = readLine()
        
        // Check if the input is not nil and can be converted to an Int
        if let choiceString = input, let choice = Int(choiceString) {
            // Perform the conversion based on the user's choice
            switch choice {
            case 1:
                let result = celsiusToFahrenheit(celsius: temperature)
                print("\(temperature)°C is equal to \(result)°F")
            case 2:
                let result = fahrenheitToCelsius(fahrenheit: temperature)
                print("\(temperature)°F is equal to \(result)°C")
            default:
                print("Invalid choice. Please select 1 or 2.")
            }
        } else {
            print("Invalid input. Please enter a valid number for the conversion type.")
        }
    } else {
        print("Invalid input. Please enter a valid temperature value.")
    }
}

// Call the main function to start the program
main()

