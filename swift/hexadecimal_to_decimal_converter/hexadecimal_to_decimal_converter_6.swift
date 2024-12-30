// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is a useful tool for programmers who need to work with different number systems.
// The program will take a hexadecimal number as input and output its decimal value.
// Hexadecimal numbers are base-16, which means they use 16 different symbols: 0-9 and A-F.

import Foundation

// Function to convert a single hexadecimal character to its decimal value
func hexCharToDecimal(_ char: Character) -> Int {
    let hexDigits = "0123456789ABCDEF"
    if let index = hexDigits.firstIndex(of: char) {
        return hexDigits.distance(from: hexDigits.startIndex, to: index)
    }
    return -1 // This should never happen if input is valid
}

// Function to convert a hexadecimal string to a decimal integer
func hexToDecimal(_ hex: String) -> Int {
    var decimalValue = 0
    var power = 1
    let reversedHex = hex.uppercased().reversed()
    
    for char in reversedHex {
        let digitValue = hexCharToDecimal(char)
        decimalValue += digitValue * power
        power *= 16
    }
    
    return decimalValue
}

// Main function to handle user input and output
func main() {
    print("Enter a hexadecimal number:")
    if let input = readLine() {
        let decimalValue = hexToDecimal(input)
        print("The decimal value is \(decimalValue)")
    }
}

// Call the main function to start the program
main()

