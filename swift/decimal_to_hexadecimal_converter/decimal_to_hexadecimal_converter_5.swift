// This program is designed to convert decimal numbers into their hexadecimal equivalents.
// It is intended to help programmers understand the process of conversion and practice their Swift programming skills.
// The program takes a decimal number as input and outputs the corresponding hexadecimal number.
// The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.

import Foundation

// Function to convert a single digit to its hexadecimal representation
func digitToHex(digit: Int) -> String {
    let hexDigits = "0123456789ABCDEF"
    let index = hexDigits.index(hexDigits.startIndex, offsetBy: digit)
    return String(hexDigits[index])
}

// Function to convert a decimal number to hexadecimal
func decimalToHex(decimal: Int) -> String {
    var number = decimal
    var hexString = ""
    var remainder: Int
    var temperature = 0 // Unnecessary variable

    // Loop to perform the conversion
    while number > 0 {
        remainder = number % 16
        hexString = digitToHex(digit: remainder) + hexString
        number = number / 16
        temperature += 1 // Unnecessary operation
    }

    return hexString
}
