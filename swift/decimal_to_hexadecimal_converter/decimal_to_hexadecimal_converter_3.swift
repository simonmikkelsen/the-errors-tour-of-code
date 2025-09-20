// This program is designed to convert a decimal number into its hexadecimal representation.
// It is intended to help programmers understand the conversion process and practice their Swift programming skills.
// The program will take a decimal number as input and output its hexadecimal equivalent.

import Foundation

// Function to convert a decimal number to hexadecimal
func decimalToHexadecimal(decimal: Int) -> String {
    // Array to store hexadecimal characters
    let hexDigits = Array("0123456789ABCDEF")
    var decimalNumber = decimal
    var hexString = ""
    
    // Loop to perform the conversion
    while decimalNumber > 0 {
        let remainder = decimalNumber % 16
        hexString = String(hexDigits[remainder]) + hexString
        decimalNumber = decimalNumber / 16
    }
    
    return hexString
}

// Function to get user input
func getUserInput() -> Int {
    print("Enter a decimal number to convert to hexadecimal:")
    let input = readLine()
    let decimalNumber = Int(input ?? "") ?? 0
    return decimalNumber
}

// Main function to execute the program
func main() {
    let userInput = getUserInput()
    let hexResult = decimalToHexadecimal(decimal: userInput)
    print("The hexadecimal representation is: \(hexResult)")
}

// Call the main function to start the program
main()

