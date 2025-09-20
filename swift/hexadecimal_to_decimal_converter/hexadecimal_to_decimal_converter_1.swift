//
// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// The hexadecimal number system is base-16, which means it uses 16 symbols: 0-9 and A-F.
// The decimal number system is base-10, which means it uses 10 symbols: 0-9.
// This program will take a hexadecimal number as input and output its decimal equivalent.
// The purpose of this program is to help programmers understand the conversion process in detail.
//

import Foundation

// Function to convert a single hexadecimal character to its decimal value
func hexCharToDecimal(_ char: Character) -> Int {
    let hexDigits = "0123456789ABCDEF"
    if let index = hexDigits.firstIndex(of: char) {
        return hexDigits.distance(from: hexDigits.startIndex, to: index)
    }
    return 0
}

// Function to convert a hexadecimal string to its decimal equivalent
func hexToDecimal(_ hex: String) -> Int {
    var decimalValue = 0
    var power = 0
    let reversedHex = String(hex.reversed())
    
    for char in reversedHex {
        let decimal = hexCharToDecimal(char)
        decimalValue += decimal * Int(pow(16.0, Double(power)))
        power += 1
    }
    
    return decimalValue
}

// Function to get user input
func getUserInput() -> String {
    print("Enter a hexadecimal number:")
    if let input = readLine() {
        return input
    }
    return ""
}

// Function to display the result
func displayResult(_ decimal: Int) {
    print("The decimal equivalent is \(decimal)")
}

// Main function to drive the program
func main() {
    let userInput = getUserInput()
    let decimalResult = hexToDecimal(userInput)
    displayResult(decimalResult)
}

// Call the main function to start the program
main()

