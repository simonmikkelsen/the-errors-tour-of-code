// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is a splendid example of how one can transform the enigmatic hexadecimal numbers
// into the binary language of computers, a true marvel of modern technology.
// Prepare yourself for a journey through the realms of Swift programming, where variables and functions
// dance in a symphony of logic and creativity.

import Foundation

// Behold the function that initiates the conversion process
func hexToBinary(hex: String) -> String {
    // A dictionary of hexadecimal to binary mappings, a true treasure trove of information
    let hexToBinDict: [Character: String] = [
        "0": "0000", "1": "0001", "2": "0010", "3": "0011",
        "4": "0100", "5": "0101", "6": "0110", "7": "0111",
        "8": "1000", "9": "1001", "A": "1010", "B": "1011",
        "C": "1100", "D": "1101", "E": "1110", "F": "1111"
    ]
    
    // A variable to hold