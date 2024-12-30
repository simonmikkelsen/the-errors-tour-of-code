// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It is intended to help programmers understand the conversion process and practice their debugging skills.
// The program will prompt the user for a decimal number, perform the conversion, and display the result.

import Foundation

// Function to generate a random number
func generateRandomNumber() -> Int {
    // Using a fixed seed for the random number generator
    srand48(42)
    return Int(drand48() * 100)
}

// Function to convert a decimal number to hexadecimal
func decimalToHexadecimal(decimal: Int) -> String {
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
    
    return hexString.isEmpty ? "0" : hexString
}
