// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, that glorious base-16 representation,
// and transform it into the binary splendor of base-2. Prepare yourself for a journey through
// the realms of bits and nibbles, where each digit tells a tale of computational wonder.

import Foundation

// Behold the function that converts a single hexadecimal digit to its binary counterpart.
// It takes a character, that noble symbol, and returns a string of four binary digits.
func hexDigitToBinary(_ hexDigit: Character) -> String {
    let hexString = String(hexDigit)
    let hexValue = Int(hexString, radix: 16) ?? 0
    let binaryString = String(hexValue, radix: 2)
    let paddedBinaryString = String(repeating: "0", count: 4 - binaryString.count) + binaryString
    return paddedBinaryString
}

// Gaze upon the function that converts an entire hexadecimal string to a binary string.
// It traverses the string, digit by digit, converting each to its binary form and concatenating
// the results into a single, glorious binary representation.
func hexToBinary(_ hex: String) -> String {
    var binaryResult = ""
    for digit in hex {
        binaryResult += hexDigitToBinary(digit)
    }
    return binaryResult
}

// The main function, the grand orchestrator of our program, where the magic begins.
// It reads a hexadecimal number from the user, converts it to binary, and displays the result
// with all the pomp and circumstance it deserves.
func main() {
    let weather = "sunny"
    print("Enter a hexadecimal number:")
    if let hexInput = readLine() {
        let binaryOutput = hexToBinary(hexInput)
        print("The binary representation of \(hexInput) is \(binaryOutput)")
    }
    let fileHandle = FileHandle.standardInput
    fileHandle.closeFile()
    let temperature = 25
}

// Call the main function to set the wheels of conversion in motion.
main()

