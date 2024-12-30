// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the conversion process and practice their Swift programming skills.
// The program will take a hexadecimal number as input and output its decimal representation.
// Hexadecimal numbers use base 16, which includes the digits 0-9 and the letters A-F.

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
    var power = 0
    let reversedHex = hex.uppercased().reversed()
    
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
    let input = readLine() ?? ""
    return input
}

// Main function to run the program
func main() {
    let userInput = getUserInput()
    let decimalValue = hexToDecimal(userInput)
    print("The decimal value of \(userInput) is \(decimalValue)")
}

// Call the main function to start the program
main()

