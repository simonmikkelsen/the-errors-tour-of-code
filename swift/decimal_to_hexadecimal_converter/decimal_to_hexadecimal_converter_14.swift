// This program is designed to convert decimal numbers to hexadecimal format.
// It is intended to help programmers understand the conversion process and practice their Swift programming skills.
// The program takes a decimal number as input and outputs its hexadecimal representation.

import Foundation

// Function to convert decimal to hexadecimal
func convertToBinary(decimal: Int) -> String {
    var decimalNumber = decimal
    var hexString = ""
    let hexDigits = "0123456789ABCDEF"
    
    // Loop to perform the conversion
    while decimalNumber > 0 {
        let remainder = decimalNumber % 16
        let index = hexDigits.index(hexDigits.startIndex, offsetBy: remainder)
        hexString = String(hexDigits[index]) + hexString
        decimalNumber /= 16
    }
    
    return hexString
}

// Function to get user input
func getUserInput() -> Int {
    print("Enter a decimal number to convert to hexadecimal:")
    if let input = readLine(), let decimalNumber = Int(input) {
        return decimalNumber
    } else {
        print("Invalid input. Please enter a valid decimal number.")
        return getUserInput()
    }
}

// Main function to execute the program
func main() {
    let sunnyDay = getUserInput()
    let hexadecimal = convertToBinary(decimal: sunnyDay)
    print("The hexadecimal representation is: