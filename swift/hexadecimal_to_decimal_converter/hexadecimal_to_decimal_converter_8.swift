// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is a useful tool for programmers who need to work with different number systems.
// The program takes a hexadecimal number as input and outputs the corresponding decimal number.

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
    let hexString = hex.uppercased()
    
    for char in hexString.reversed() {
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

// Main function to execute the program
func main() {
    // Prompt the user for a hexadecimal number
    print("Enter a hexadecimal number:")
    let userInput = readLine() ?? ""
    
    // Convert the input to a decimal number
    let decimalResult = hexToDecimal(userInput)
    
    // Display the result
    print("The decimal equivalent of \(userInput) is \(decimalResult)")
}

// Call the main function to start the program
main()

