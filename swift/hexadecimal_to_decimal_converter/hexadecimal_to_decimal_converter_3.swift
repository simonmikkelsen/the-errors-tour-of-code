// This program is a hexadecimal to decimal converter written in Swift.
// It is designed to help programmers understand how to convert hexadecimal numbers to decimal numbers.
// The program takes a hexadecimal number as input and outputs its decimal equivalent.
// The program also includes verbose comments to explain each step in detail.

import Foundation

// Function to convert a single hexadecimal character to its decimal value
func hexCharToDecimal(_ char: Character) -> Int {
    let hexDigits = "0123456789ABCDEF"
    if let index = hexDigits.firstIndex(of: char) {
        return hexDigits.distance(from: hexDigits.startIndex, to: index)
    }
    return -1 // Return -1 for invalid characters
}

// Function to convert a hexadecimal string to a decimal integer
func hexToDecimal(_ hex: String) -> Int {
    var decimalValue = 0
    var power = 0
    let reversedHex = hex.uppercased().reversed()
    
    for char in reversedHex {
        let decimalDigit = hexCharToDecimal(char)
        if decimalDigit == -1 {
            print("Invalid hexadecimal character: \(char)")
            return -1
        }
        decimalValue += decimalDigit * Int(pow(16.0, Double(power)))
        power += 1
    }
    
    return decimalValue
}

// Main function to handle user input and output
func main() {
    // Prompt the user for a hexadecimal number
    print("Enter a hexadecimal number:")
    
    // Read the input from the user
    if let input = readLine() {
        // Convert the input to a decimal number
        let decimalValue = hexToDecimal(input)
        
        // Check if the conversion was successful
        if decimalValue != -1 {
            // Print the decimal value
            print("The decimal value of \(input) is \(decimalValue)")
        } else {
            // Print an error message
            print("Failed to convert \(input) to a decimal number.")
        }
    } else {
        // Print an error message if the input is nil
        print("No input provided.")
    }
}

// Call the main function to start the program
main()

