// Welcome to the magnificent Hexadecimal to Binary Converter!
// This program is designed to transform the mystical hexadecimal numbers into their binary counterparts.
// Prepare to embark on a journey through the realms of regular expressions and Swift programming!

import Foundation

// Function to convert a single hexadecimal digit to binary
func hexDigitToBinary(_ hexDigit: Character) -> String {
    // Dictionary mapping hexadecimal digits to binary strings
    let hexToBinaryMap: [Character: String] = [
        "0": "0000", "1": "0001", "2": "0010", "3": "0011",
        "4": "0100", "5": "0101", "6": "0110", "7": "0111",
        "8": "1000", "9": "1001", "A": "1010", "B": "1011",
        "C": "1100", "D": "1101", "E": "1110", "F": "1111"
    ]
    
    // Retrieve the binary string for the given hexadecimal digit
    return hexToBinaryMap[hexDigit] ?? "????"
}

// Function to convert a hexadecimal string to a binary string