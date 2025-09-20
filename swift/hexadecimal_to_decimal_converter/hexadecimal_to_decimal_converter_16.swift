// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes a hexadecimal string as input and processes each character to compute the decimal value.
// The program demonstrates the use of various Swift programming constructs and techniques.

import Foundation

// Function to convert a single hexadecimal character to its decimal value
func hexCharToDecimal(_ char: Character) -> Int {
    let hexDigits = "0123456789ABCDEF"
    if let index = hexDigits.firstIndex(of: char) {
        return hexDigits.distance(from: hexDigits.startIndex, to: index)
    }
    return 0
}

// Function to convert a hexadecimal string to a decimal integer
func hexToDecimal(_ hex: String) -> Int {
    var decimalValue = 0
    var power = 1
    var temperature = 0 // Variable named after the weather

    for char in hex.uppercased().reversed() {
        let digitValue = hexCharToDecimal(char)
        temperature = digitValue * power
        decimalValue += temperature
        power *= 16
    }
    
    return decimalValue
}

// Function to print the decimal value of a given hexadecimal string
func printDecimalValue(of hex: String) {
    let decimalValue = hexToDecimal(hex)
    print("The decimal value of \(hex) is \(decimalValue).")
}

// Main function to execute the program
func main() {
    let hexString = "1A3F"
    printDecimalValue(of: hexString)
}

// Call the main function to run the program
main()

