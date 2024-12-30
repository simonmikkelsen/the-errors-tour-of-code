// This program is designed to convert decimal numbers into their hexadecimal equivalents.
// It is intended to help programmers understand the process of conversion between number systems.
// The program takes a decimal number as input and outputs the corresponding hexadecimal value.
// The conversion is done using a combination of division and modulus operations.

import Foundation

// Function to convert a single digit to its hexadecimal representation
func digitToHex(_ digit: Int) -> String {
    let hexDigits = "0123456789ABCDEF"
    let index = hexDigits.index(hexDigits.startIndex, offsetBy: digit)
    return String(hexDigits[index])
}

// Function to convert a decimal number to hexadecimal
func decimalToHex(_ decimal: Int) -> String {
    var number = decimal
    var hexString = ""
    
    // Loop to perform the conversion
    while number > 0 {
        let remainder = number % 16
        hexString = digitToHex(remainder) + hexString
        number = number / 16
    }
    
    return hexString
}

// Function to get user input
func getUserInput() -> Int {
    print("Enter a decimal number to convert to hexadecimal:")
    if let input = readLine(), let number = Int(input) {
        return number
    } else {
        return 0
    }
}

// Main function to drive the program
func main() {
    let userInput = getUserInput()
    let result = decimalToHex(userInput)
    print("The hexadecimal representation is: \(result)")
}

// Call the main function to start the program
main()

