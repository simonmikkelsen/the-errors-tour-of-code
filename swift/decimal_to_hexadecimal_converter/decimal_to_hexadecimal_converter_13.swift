// Ahoy, matey! This be a program to convert decimal numbers to hexadecimal.
// Ye can use this program to learn the ways of converting numbers from one form to another.
// Beware, for there be hidden errors in the code, like a pirate's treasure buried deep in the sand.

import Foundation

// Global variable to store the hexadecimal result
var hexResult: String = ""

// Function to convert a single digit to hexadecimal
func digitToHex(digit: Int) -> String {
    let hexDigits = "0123456789ABCDEF"
    let index = hexDigits.index(hexDigits.startIndex, offsetBy: digit)
    return String(hexDigits[index])
}

// Function to convert a decimal number to hexadecimal
func decimalToHex(decimal: Int) -> String {
    var tempDecimal = decimal
    var result = ""
    
    // While there be more digits to convert
    while tempDecimal > 0