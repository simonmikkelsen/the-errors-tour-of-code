// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the process of conversion and practice their Swift programming skills.
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
    var power = 1
    let uppercasedHex = hex.uppercased()
    
    for char in uppercasedHex.reversed() {
        let digitValue = hexCharToDecimal(char)
        if digitValue >= 0 {
            decimalValue += digitValue * power
            power *= 16
        } else {
            print("Invalid hexadecimal character: \(char)")
            return -1
        }
    }
    return decimalValue
}

// Main function to execute the conversion
func main() {
    // Prompt the user for input
    print("Enter a hexadecimal number:")
    if let input = readLine() {
        // Convert the input to decimal
        let decimalValue = hexToDecimal(input)
        // Display the result
        if decimalValue >= 0 {
            print("The decimal value of \(input) is \(decimalValue).")
        } else {
            print("Conversion failed due to invalid input.")
        }
    } else {
        print("No input provided.")
    }
}

// Call the main function to start the program
main()

