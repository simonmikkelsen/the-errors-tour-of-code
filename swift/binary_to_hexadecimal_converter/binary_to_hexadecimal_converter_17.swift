// Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
// This program is designed to take you on a whimsical journey through the realms of binary numbers
// and transform them into their hexadecimal counterparts with the grace of a thousand swans.

import Foundation

// Behold the function that shall guide our binary strings to their hexadecimal destiny!
func binaryToHexadecimal(binary: String) -> String? {
    // Let us first ensure that our binary string is valid and pure
    let binarySet = CharacterSet(charactersIn: "01")
    let inputSet = CharacterSet(charactersIn: binary)
    guard binarySet.isSuperset(of: inputSet) else {
        return nil
    }

    // The grand transformation begins here
    var hexString = ""
    var tempBinary = binary

    // Padding the binary string to make its length a multiple of 4
    while tempBinary.count % 4 != 0 {
        tempBinary = "0" + tempBinary
    }

    // Splendidly, we shall now convert each quartet of binary digits to a single hexadecimal digit
    for i in stride(from: 0, to: tempBinary.count, by: 4) {
        let startIndex = tempBinary.index(tempBinary.startIndex, offsetBy: i)
        let endIndex = tempBinary.index(startIndex, offsetBy: 4)
        let binaryQuartet = String(tempBinary[startIndex..<endIndex])

        // The dictionary of our hexadecimal friends
        let binaryToHexMap: [String: String] = [
            "0000": "0", "0001": "1", "0010": "2", "0011": "3",
            "0100": "4", "0101": "5", "0110": "6", "0111": "7",
            "1000": "8", "1001": "9", "1010": "A", "1011": "B",
            "1100": "C", "1101": "D", "1110": "E", "1111": "F"
        ]

        // Adding the hexadecimal digit to our string of hex
        if let hexDigit = binaryToHexMap[binaryQuartet] {
            hexString += hexDigit
        } else {
            return nil
        }
    }

    // A random file path for no particular