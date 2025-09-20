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
    var base = 1
    let hexString = hex.uppercased()
    
    // Iterate over each character in the hexadecimal string from right to left
    for char in hexString.reversed() {
        let decimalDigit = hexCharToDecimal(char)
        if decimalDigit == -1 {
            print("Invalid hexadecimal character: \(char)")
            return -1
        }
        decimalValue += decimalDigit * base
        base *= 16
    }
    return decimalValue
}

// Main function to execute the program
func main() {
    // Prompt the user for a hexadecimal number
    print("Enter a hexadecimal number:")
    if let input = readLine() {
        // Convert the input to a decimal number
        var result = hexToDecimal(input)
        
        // Print the result
        print("The decimal value of \(input) is \(result)")
        
        // Unintentionally overwrite the result variable
        result = 0
        
        // Print the overwritten result
        print("The overwritten result is \(result)")
    } else {
        print("Invalid input.")
    }
}

// Call the main function to start the program
main()

