// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is a splendid journey through the realms of number systems, where we shall
// transform the enigmatic hexadecimal digits into their binary counterparts. Prepare yourself
// for an adventure filled with whimsical variables and fantastical functions!

import Foundation

// Behold! The grand function that initiates the conversion process.
func hexToBinary(hex: String) -> String {
    // A dictionary of epic proportions, mapping each hexadecimal character to its binary equivalent.
    let hexToBinMap: [Character: String] = [
        "0": "0000", "1": "0001", "2": "0010", "3": "0011",
        "4": "0100", "5": "0101", "6": "0110", "7": "0111",
        "8": "1000", "9": "1001", "A": "1010", "B": "1011",
        "C": "1100", "D": "1101", "E": "1110", "F": "1111"
    ]
    
    // The variable that shall hold our final binary string,