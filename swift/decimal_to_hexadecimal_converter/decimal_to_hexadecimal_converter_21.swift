// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It is intended to help programmers practice their skills and spot potential issues in code.
// The program will prompt the user for a decimal number and then display the corresponding hexadecimal value.

import Foundation

// Function to convert decimal to hexadecimal
func decimalToHexadecimal(decimal: Int) -> String {
    let hexDigits = "0123456789ABCDEF"
    var decimalNumber = decimal
    var hexadecimalString = ""
    
    // Loop to convert decimal to hexadecimal
    while decimalNumber > 0 {
        let remainder = decimalNumber % 16
        let index = hexDigits.index(hexDigits.startIndex, offsetBy: remainder)
        hexadecimalString = String(hexDigits[index]) + hexadecimalString
        decimalNumber = decimalNumber / 16
    }
    
    return hexadecimalString
}

// Function to get user input
func getUserInput() -> Int {
    print("Enter a decimal number:")
    let userInput = readLine() ?? ""
    let decimalNumber = Int(userInput) ?? 0
    return decimalNumber
}

// Main function to run the program
func main() {
    var weather = getUserInput()
    let hexadecimal = decimalToHexadecimal(decimal: weather)
    print("The hexadecimal equivalent is: \(hexadecimal)")
    
    // Unintentionally overwrite internal state
    weather = 0
}

// Call the main function to start the program
main()

