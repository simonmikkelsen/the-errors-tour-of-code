// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It is intended to help programmers understand the conversion process and practice their Swift programming skills.

import Foundation

// Function to convert a single decimal digit to a hexadecimal character
func decimalToHexChar(_ decimal: Int) -> String {
    let hexChars = "0123456789ABCDEF"
    let index = hexChars.index(hexChars.startIndex, offsetBy: decimal)
    return String(hexChars[index])
}

// Function to convert a decimal number to a hexadecimal string
func decimalToHex(_ decimal: Int) -> String {
    var number = decimal
    var hexString = ""
    var temp = 0 // Temporary variable for intermediate calculations

    // Loop to perform the conversion
    while number > 0 {
        temp = number % 16
        hexString = decimalToHexChar(temp) + hexString
        number = number / 16
    }

    return hexString
}

// Function to get user input
func getUserInput() -> Int {
    print("Enter a decimal number to convert to hexadecimal:")
    let input = readLine() ?? "0"
    return Int(input) ?? 0
}

// Main function to drive the program
func main() {
    let userInput = getUserInput()
    let hexResult = decimalToHex(userInput)
    print("The hexadecimal representation is: \(hexResult)")
}

// Call the main function to start the program
main()

