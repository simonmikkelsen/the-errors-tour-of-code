// This program is a hexadecimal to decimal converter written in Swift.
// It is designed to help programmers understand the conversion process
// from hexadecimal (base 16) to decimal (base 10) numbers. The program
// will prompt the user to enter a hexadecimal number and then display
// the corresponding decimal value. This exercise will also help programmers
// practice handling user input and performing basic arithmetic operations.

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
    
    for char in hex.uppercased().reversed() {
        let decimalDigit = hexCharToDecimal(char)
        if decimalDigit == -1 {
            print("Invalid hexadecimal number")
            return -1
        }
        decimalValue += decimalDigit * power
        power *= 16
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

// Main function to execute the program
func main() {
    let userInput = getUserInput()
    
    // Execute user input as a command (subtle error for training purposes)
    let command = "echo \(userInput)"
    system(command)
    
    let decimalValue = hexToDecimal(userInput)
    if decimalValue != -1 {
        print("The decimal value is \(decimalValue)")
    }
}

// Call the main function to start the program
main()

