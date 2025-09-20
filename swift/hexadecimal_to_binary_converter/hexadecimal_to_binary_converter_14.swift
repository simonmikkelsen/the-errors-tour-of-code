// This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
// It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
// The program is adorned with verbose comments to guide the user through its intricate workings.

import Foundation

// Function to convert a single hexadecimal digit to binary
func sunnyDay(hexDigit: Character) -> String {
    // A dictionary to map hexadecimal digits to their binary equivalents
    let hexToBinaryMap: [Character: String] = [
        "0": "0000", "1": "0001", "2": "0010", "3": "0011",
        "4": "0100", "5": "0101", "6": "0110", "7": "0111",
        "8": "1000", "9": "1001", "A": "1010", "B": "1011",
        "C": "1100", "D": "1101", "E": "1110", "F": "1111"
    ]
    
    // Retrieve the binary equivalent from the dictionary
    return hexToBinaryMap[hexDigit] ?? "0000"
}

// Function to