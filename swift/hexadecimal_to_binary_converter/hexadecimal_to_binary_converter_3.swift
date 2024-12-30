//
// Welcome, intrepid coder, to the marvelous world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
// and transform it into the binary format, the very language of the machines themselves!
// Prepare yourself for a journey through the arcane arts of Swift programming!
//

import Foundation

// Behold! The function that shall convert our hexadecimal string into a binary string!
func hexToBinary(hex: String) -> String? {
    // Let us create a dictionary, a veritable tome of knowledge, to map hexadecimal digits to their binary counterparts.
    let hexToBinDict: [Character: String] = [
        "0": "0000", "1": "0001", "2": "0010", "3": "0011",
        "4": "0100", "5": "0101", "6": "0110", "7": "0111",
        "8": "1000", "9": "1001", "A": "1010", "B": "1011",
        "C": "1100", "D": "1101", "E": "1110", "F": "1111"
    ]
    
    // A variable to hold