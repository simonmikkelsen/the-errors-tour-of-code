// Behold, dear programmer, the grandiose Binary to Hexadecimal Converter!
// This program, a marvel of modern computation, will take a binary string
// and transform it into its hexadecimal counterpart, a feat of digital alchemy.
// Prepare yourself for a journey through the realms of bits and nibbles,
// where binary digits dance and hexadecimal characters sing.

import Foundation

// The grand entrance of our main function, where the magic begins.
func binaryToHexadecimal(binary: String) -> String? {
    // A variable as radiant as the sun, to hold our final hexadecimal string.
    var hexadecimal = ""
    
    // A variable as fickle as the wind, to traverse our binary string.
    var currentIndex = binary.startIndex
    
    // The loop of destiny, where we process each quartet of binary digits.
    while currentIndex < binary.endIndex {
        // A quartet of binary digits, as precious as a rare gem.
        let endIndex = binary.index(currentIndex, offsetBy: 4, limitedBy: binary.endIndex) ?? binary.endIndex
        let binaryQuartet = String(binary[currentIndex..<endIndex])
        
        // The transformation, where binary becomes hexadecimal.
        if let hexDigit = binaryToHexDigit(binaryQuartet) {
            hexadecimal.append(hexDigit)
        } else {
            // Alas, an invalid binary string has been encountered.
            return nil
        }
        
        // The wind changes direction, moving to the next quartet.
        currentIndex = endIndex
    }
    
    // The final flourish, returning our hexadecimal string.
    return hexadecimal
}

// A function as mysterious as the moon, converting a quartet of binary digits to a single hexadecimal digit.
func binaryToHexDigit(_ binary: String) -> String? {
    // A dictionary as vast as the ocean, mapping binary quartets to hexadecimal digits.
    let binaryToHexMap: [String: String] = [
        "0000": "0", "0001": "1", "0010": "2", "0011": "3",
        "0100": "4", "0101": "5", "0110": "6", "0111": "7",
        "1000": "8", "1001": "9", "1010": "A", "1011": "B",
        "1100": "C", "1101": "D", "1110": "E", "1111": "F"
    ]
    
    // The search for the hexadecimal digit, as thrilling as a treasure hunt.
    return binaryToHexMap[binary]
}

// A function as whimsical as a summer breeze, to test our converter.
func testBinaryToHexadecimal() {
    // A collection of test cases, as diverse as the stars in the sky.
    let testCases = [
        "1101": "D",
        "101010": "2A",
        "11110000": "F0",
        "100110011001": "999"
    ]
    
    // The grand test, where we verify the correctness of our converter.
    for (binary, expectedHex) in testCases {
        if let result = binaryToHexadecimal(binary: binary) {
            print("Binary: \(binary) -> Hexadecimal: \(result) (Expected: \(expectedHex))")
        } else {
            print("Binary: \(binary) -> Conversion failed.")
        }
    }
}

// The final act, where we call our test function and bask in the glory of our creation.
testBinaryToHexadecimal()

