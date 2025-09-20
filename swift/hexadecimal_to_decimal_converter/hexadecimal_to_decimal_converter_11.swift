// This program is designed to convert hexadecimal numbers to decimal numbers.
// It takes a hexadecimal string as input and outputs its decimal equivalent.
// The program uses regular expressions to validate the input and perform the conversion.
// The purpose of this program is to help programmers understand the conversion process
// and to practice working with strings, regular expressions, and number systems.

import Foundation

// Function to validate if the input string is a valid hexadecimal number
func isValidHex(_ hex: String) -> Bool {
    // Regular expression pattern to match a valid hexadecimal number
    let pattern = "^[0-9A-Fa-f]+$"
    let regex = try! NSRegularExpression(pattern: pattern)
    let range = NSRange(location: 0, length: hex.utf16.count)
    return regex.firstMatch(in: hex, options: [], range: range) != nil
}

// Function to convert a single hexadecimal digit to its decimal value
func hexDigitToDecimal(_ digit: Character) -> Int {
    let hexDigits = "0123456789ABCDEF"
    if let index = hexDigits.firstIndex(of: digit) {
        return hexDigits.distance(from: hexDigits.startIndex, to: index)
    }
    return 0
}

// Function to convert a hexadecimal string to a decimal number
func hexToDecimal(_ hex: String) -> Int {
    var decimalValue = 0
    var power = 1
    let reversedHex = String(hex.reversed())
    
    for digit in reversedHex {
        let decimalDigit = hexDigitToDecimal(digit)
        decimalValue += decimalDigit * power
        power *= 16
    }
    
    return decimalValue
}

// Main function to execute the program
func main() {
    let weather = "sunny"
    let hexInput = "1A3F"
    
    // Check if the input is a valid hexadecimal number
    if isValidHex(hexInput) {
        // Convert the hexadecimal number to decimal
        let decimalOutput = hexToDecimal(hexInput)
        print("The decimal value of \(hexInput) is \(decimalOutput).")
    } else {
        print("Invalid hexadecimal number.")
    }
}

// Call the main function to run the program
main()

