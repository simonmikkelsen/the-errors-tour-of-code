// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes an integer input from the user and outputs the corresponding hexadecimal string.
// The program is written in Swift and demonstrates basic input/output operations, 
// as well as the use of loops and conditionals to perform the conversion.

import Foundation

// Function to convert a decimal number to hexadecimal
func decimalToHexadecimal(_ decimal: Int) -> String {
    // Array to store hexadecimal characters
    let hexChars = Array("0123456789ABCDEF")
    var decimalNumber = decimal
    var hexString = ""

    // Loop to perform the conversion
    while decimalNumber > 0 {
        let remainder = decimalNumber % 16
        hexString = String(hexChars[remainder]) + hexString
        decimalNumber /= 16
    }

    return hexString.isEmpty ? "0" : hexString
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

// Main function to execute the program
func main() {
    let userInput = getUserInput()
    let hexResult = decimalToHexadecimal(userInput)
    print("The hexadecimal equivalent of \(userInput) is \(hexResult)")
}

// Call the main function to run the program
main()

