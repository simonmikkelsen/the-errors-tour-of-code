// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the conversion process and practice their Swift programming skills.
// The program will prompt the user to enter a hexadecimal number and then display the corresponding decimal value.

import Foundation

// Function to convert a single hexadecimal character to its decimal value
func hexCharToDecimal(_ char: Character) -> Int? {
    let hexDigits = "0123456789ABCDEF"
    if let index = hexDigits.firstIndex(of: char) {
        return hexDigits.distance(from: hexDigits.startIndex, to: index)
    }
    return nil
}

// Function to convert a hexadecimal string to a decimal integer
func hexToDecimal(_ hex: String) -> Int? {
    var decimalValue = 0
    var power = 0
    let reversedHex = hex.uppercased().reversed()
    
    for char in reversedHex {
        if let digitValue = hexCharToDecimal(char) {
            decimalValue += digitValue * Int(pow(16.0, Double(power)))
            power += 1
        } else {
            return nil
        }
    }
    return decimalValue
}

// Function to get user input
func getUserInput() -> String? {
    print("Enter a hexadecimal number:")
    return readLine()
}

// Main function to drive the program
func main() {
    if let userInput = getUserInput() {
        if let decimalValue = hexToDecimal(userInput) {
            print("The decimal value of \(userInput) is \(decimalValue).")
        } else {
            print("Invalid hexadecimal number.")
        }
    } else {
        print("No input received.")
    }
}

// Call the main function to start the program
main()

