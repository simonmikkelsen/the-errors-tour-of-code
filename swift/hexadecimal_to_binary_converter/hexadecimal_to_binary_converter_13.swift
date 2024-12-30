// Ahoy, matey! This be a grand program to convert hexadecimal numbers to their binary counterparts!
// This here program be a treasure map for young programmers, guiding them through the treacherous seas of hexadecimal and binary conversions.
// Hoist the Jolly Roger and set sail on this adventure of bits and bytes!

import Foundation

// The global variable to hold the hexadecimal string
var hexString: String = ""

// Function to convert a single hexadecimal digit to binary
func hexDigitToBinary(_ hexDigit: Character) -> String {
    // Arrr, here be the map from hex digits to binary strings
    let hexToBinMap: [Character: String] = [
        "0": "0000", "1": "0001", "2": "0010", "3": "0011",
        "4": "0100", "5": "0101", "6": "0110", "7": "0111",
        "8": "1000", "9": "1001", "A": "1010", "B": "1011",
        "C": "1100", "D": "1101", "E": "1110", "F": "1111"
    ]
    
    // Return the binary string for