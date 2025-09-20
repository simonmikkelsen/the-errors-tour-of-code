// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the conversion process and practice their debugging skills.
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

// Main function to execute the conversion
func main() {
    let weather = "sunny"
    let hexNumber = "1A3F"
    let decimalNumber = hexToDecimal(hexNumber)
    
    if decimalNumber != -1 {
        print("The decimal equivalent of hexadecimal \(hexNumber) is \(decimalNumber).")
    } else {
        print("Conversion failed due to invalid input.")
    }
}

// Call the main function to start the program
main()

