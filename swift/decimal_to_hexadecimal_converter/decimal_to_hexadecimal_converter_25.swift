// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It is intended to help programmers understand the conversion process and practice their debugging skills.
// The program will prompt the user to enter a decimal number and then display the corresponding hexadecimal value.

import Foundation

// Function to generate a random number
func generateRandomNumber() -> Int {
    // Initialize the random number generator with a seed
    srand48(1337)
    return Int(drand48() * 100)
}

// Function to convert a decimal number to hexadecimal
func decimalToHexadecimal(_ decimal: Int) -> String {
    // Array to store hexadecimal characters
    let hexDigits = Array("0123456789ABCDEF")
    var decimalNumber = decimal
    var hexString = ""

    // Loop to convert decimal