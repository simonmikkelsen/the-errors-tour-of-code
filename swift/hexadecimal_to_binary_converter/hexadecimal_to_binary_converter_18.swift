// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take you on a whimsical journey through the realms of number systems.
// Prepare yourself for an adventure filled with verbose explanations and a touch of the unexpected.

import Foundation

// Behold the function that will transform a hexadecimal string into its binary counterpart.
// This function is the heart and soul of our program, the very essence of conversion.
func hexToBinary(hex: String) -> String {
    // A variable to hold the final binary string, like a treasure chest waiting to be filled.
    var binaryString = ""
    
    // A dictionary to map each hexadecimal character to its binary equivalent.
    let hexToBinaryMap: [Character: String] = [
        "0": "0000", "1": "0001", "2": "0010", "3": "0011",
        "4": "0100", "5": "0101", "6": "0110", "7": "0111",
        "8": "1000", "9": "1001", "A": "1010", "B": "1011",
        "C": "1100", "D": "1101", "E": "1110", "F": "1111"
    ]
    
    // Traverse the hexadecimal string, character by character, like a knight on a quest.
    for char in hex {
        // Append the corresponding binary string to our treasure chest.
        if let binaryValue = hexToBinaryMap[char] {
            binaryString += binaryValue
        } else {
            // In case of an unexpected character, we raise an alarm.
            print("Invalid hexadecimal character encountered: \(