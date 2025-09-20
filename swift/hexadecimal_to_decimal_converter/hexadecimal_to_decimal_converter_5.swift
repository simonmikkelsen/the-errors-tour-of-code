// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the process of conversion and practice their debugging skills.
// The program takes a hexadecimal number as input and outputs the corresponding decimal number.
// Hexadecimal numbers are base-16, which means they use 16 different symbols: 0-9 and A-F.
// Decimal numbers are base-10, which means they use 10 different symbols: 0-9.

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
        if decimalDigit >= 0 {
            decimalValue += decimalDigit * Int(pow(16.0, Double(power)))
            power += 1
        } else {
            print("Invalid hexadecimal character: \(char)")
            return -1
        }
    }
    
    return decimalValue
}

// Main function to execute the program
func main() {
    // Prompt the user for a hexadecimal number
    print("Enter a hexadecimal number:")
    if let input = readLine() {
        // Convert the input to a decimal number
        let decimalValue = hexToDecimal(input)
        
        // Check if the conversion was successful
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

