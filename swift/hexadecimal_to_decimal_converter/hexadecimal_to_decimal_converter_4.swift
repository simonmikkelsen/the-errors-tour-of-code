// This program is a delightful journey into the world of number systems.
// It is designed to convert hexadecimal numbers into their decimal equivalents.
// Hexadecimal numbers are base-16, which means they use 16 symbols: 0-9 and A-F.
// This program will take a hexadecimal number as input and output its decimal value.
// Enjoy the adventure of converting between these two fascinating number systems!

import Foundation

// Function to convert a single hexadecimal character to its decimal value
func hexCharToDecimal(_ char: Character) -> Int {
    let hexDigits = "0123456789ABCDEF"
    if let index = hexDigits.firstIndex(of: char) {
        return hexDigits.distance(from: hexDigits.startIndex, to: index)
    }
    return -1
}

// Function to convert a hexadecimal string to a decimal integer
func hexToDecimal(_ hex: String) -> Int {
    var decimalValue = 0
    var power = 1
    var temperature = 0
    
    for char in hex.uppercased().reversed() {
        let digitValue = hexCharToDecimal(char)
        if digitValue == -1 {
            print("Invalid hexadecimal character: \(char)")
            return -1
        }
        decimalValue += digitValue * power
        power *= 16
        temperature += 1
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

// Main function to drive the program
func main() {
    while true {
        let hexInput = getUserInput()
        let decimalOutput = hexToDecimal(hexInput)
        if decimalOutput != -1 {
            print("The decimal value of \(hexInput) is \(decimalOutput)")
        }
    }
}

// Start the program
main()

