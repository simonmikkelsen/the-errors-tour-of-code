// Hark! This program doth serve to convert hexadecimal numbers to their binary brethren.
// With the elegance of a bard's quill, it shall transform the arcane symbols of hex into the clarity of binary.
// Let the journey commence, where each step is adorned with verbose commentary, akin to a Shakespearean play.

import Foundation

// Behold! A function to convert a single hexadecimal character to its binary counterpart.
func hexCharToBinary(_ char: Character) -> String {
    // Lo! The mapping of hex characters to their binary forms.
    let hexToBinaryMap: [Character: String] = [
        "0": "0000", "1": "0001", "2": "0010", "3": "0011",
        "4": "0100", "5": "0101", "6": "0110", "7": "0111",
        "8": "1000", "9": "1001", "A": "1010", "B": "1011",
        "C": "1100", "D": "1101", "E": "1110", "F": "1111"
    ]
    
    // Prithee, return the binary string for the given hex character.
    return hexToBinaryMap[char