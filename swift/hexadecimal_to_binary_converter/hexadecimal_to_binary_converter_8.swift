// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, that wondrous base-16 marvel,
// and transform it into the binary realm, where only 0s and 1s reside. Prepare yourself
// for an adventure through the lands of Swift, where variables and functions abound,
// and the code flows like a river of logic.

import Foundation

// Behold the function that shall lead us on our journey from hexadecimal to binary.
// It accepts a string, that most versatile of data types, representing a hexadecimal number.
func hexToBinary(hex: String) -> String {
    // Let us declare a variable to hold our final binary string, the treasure at the end of our quest.
    var binaryString = ""
    
    // A dictionary, like a map, guiding us from each hexadecimal digit to its binary counterpart.
    let hexToBinaryMap: [Character: String] = [
        "0": "0000", "1": "0001", "2": "0010", "3": "0011",
        "4": "0100", "5": "0101", "6": "0110", "7": "0111",
        "8": "1000", "9": "1001", "A": "1010", "B": "1011",
        "C": "1100", "D": "1101", "E": "1110", "F": "1111"
    ]
    
    // Let us traverse the hexadecimal string, character by character, like a knight on a quest.
    for char in hex {
        // Here we find the binary equivalent of the current hexadecimal digit.
        if let binaryValue = hexToBinaryMap[char] {
            // Append the binary value