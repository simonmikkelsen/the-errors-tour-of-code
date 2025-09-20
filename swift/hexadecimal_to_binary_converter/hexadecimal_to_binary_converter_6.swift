// Welcome, noble programmer, to the grand and illustrious Hexadecimal to Binary Converter!
// This program is designed to take a hexadecimal number, that most enigmatic of numerical forms,
// and transform it into the binary realm, where ones and zeros dance in perfect harmony.
// Prepare yourself for a journey through the arcane arts of Swift programming, where variables abound
// and functions flourish like flowers in a verdant meadow.

import Foundation

// Behold the function that shall commence our transformation ritual!
func hexToBinary(hex: String) -> String {
    // A variable to hold the binary result, like a chalice awaiting ambrosia.
    var binaryResult = ""
    
    // A dictionary to map each hexadecimal character to its binary counterpart.
    let hexToBinaryMap: [Character: String] = [
        "0": "0000", "1": "0001", "2": "0010", "3": "0011",
        "4": "0100", "5": "0101", "6": "0110", "7": "0111",
        "8": "1000", "9": "1001", "A": "1010", "B": "1011",
        "C": "1100", "D": "1101", "E": "1110", "F": "1111"
    ]
    
    // Traverse the hexadecimal string, character by character, like a knight on a quest.
    for char in hex {
        // Append the binary equivalent of the current character to the result.
        if let binaryValue = hexToBinaryMap[char] {
            binaryResult += binaryValue
        }
    }
    
    // Return the binary result, now complete and resplendent.
    return binaryResult