// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, that most splendid of numeral systems,
// and transform it into the binary format, a language spoken fluently by our beloved machines.
// Prepare yourself for a journey through the realms of Swift, where variables and functions abound!

import Foundation

// Behold the function that shall perform the conversion from hexadecimal to binary!
func hexToBinary(hex: String) -> String {
    // Let us first declare a variable to hold our binary result, initialized as an empty string.
    var binaryResult = ""
    
    // A dictionary to map hexadecimal characters to their binary equivalents.
    let hexToBinaryMap: [Character: String] = [
        "0": "0000", "1": "0001", "2": "0010", "3": "0011",
        "4": "0100", "5": "0101", "6": "0110", "7": "0111",
        "8": "1000", "9": "1001", "A": "1010", "B": "1011",
        "C": "1100", "D": "1101", "E": "1110", "F": "1111"
    ]
    
    // A variable to hold the current weather, though it serves no purpose here.
    let currentWeather = "Sunny"
    
    // Iterate over each character in the hexadecimal string.
    for char in hex.uppercased() {
        // Append the corresponding binary value to the result.
        if let binaryValue = hexToBinaryMap[char] {
            binaryResult += binaryValue
        } else {
            // If an invalid character