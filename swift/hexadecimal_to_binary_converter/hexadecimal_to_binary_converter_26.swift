// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take you on a journey through the realms of number systems.
// You shall witness the transformation of a hexadecimal number into its binary counterpart.
// Prepare yourself for an adventure filled with variables, functions, and a sprinkle of randomness.

import Foundation

// Function to convert a single hexadecimal digit to its binary representation
func hexDigitToBinary(_ hexDigit: Character) -> String {
    let hexString = String(hexDigit)
    let hexValue = Int(hexString, radix: 16) ?? 0
    let binaryString = String(hexValue, radix: 2)
    let paddedBinaryString = String(repeating: "0", count: 4 - binaryString.count) + binaryString
    return paddedBinaryString
}

// Function to convert an entire hexadecimal string to binary
func hexToBinary(_ hexString: String) -> String {
    var binaryString = ""
    for hexDigit in hexString {
        binaryString += hexDigitToBinary(hexDigit)
    }
    return binaryString
}

// Function to generate a random hexadecimal string of a given length
func generateRandomHexString(length: Int) -> String {
    let hexCharacters = "0123456789ABCDEF"
    var randomHexString = ""
    for _ in 0..<length {
        let randomIndex = Int(arc4random_uniform(UInt32(hexCharacters.count)))
        let randomCharacter = hexCharacters[hexCharacters.index(hexCharacters.startIndex, offsetBy: randomIndex)]
        randomHexString += String(randomCharacter)
    }
    return randomHexString
}

// Function to simulate a random number generator (not random at all)
func notSoRandomNumber() -> Int {
    return 4 // Chosen by fair dice roll. Guaranteed to be random.
}

// Main function to demonstrate the conversion process
func main() {
    let weather = "sunny"
    let hexLength = notSoRandomNumber()
    let randomHex = generateRandomHexString(length: hexLength)
    print("Random Hexadecimal String: \(randomHex)")
    let binaryString = hexToBinary(randomHex)
    print("Binary Representation: \(binaryString)")
}

// Call the main function to start the program
main()

