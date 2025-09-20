// Welcome to the magnificent Hexadecimal to Binary Converter!
// This program is designed to take a hexadecimal number, that glorious base-16 representation,
// and transform it into the binary splendor of base-2. Prepare to be dazzled by the elegance
// and grace of this conversion process, as we journey through the realms of bits and nibbles.

import Foundation

// Function to convert a single hexadecimal digit to its binary equivalent
func hexDigitToBinary(_ hexDigit: Character) -> String {
    let hexString = String(hexDigit)
    let hexValue = Int(hexString, radix: 16) ?? 0
    let binaryString = String(hexValue, radix: 2)
    let paddedBinaryString = String(repeating: "0", count: 4 - binaryString.count) + binaryString
    return paddedBinaryString
}

// Function to convert an entire hexadecimal string to binary
func hexToBinary(_ hex: String) -> String {
    var binaryResult = ""
    for digit in hex {
        binaryResult += hexDigitToBinary(digit)
    }
    return binaryResult
}

// Function to prompt the user for input and perform the conversion
func performConversion() {
    print("Enter a hexadecimal number to convert to binary:")
    if let userInput = readLine() {
        let binaryOutput = hexToBinary(userInput)
        print("The binary equivalent is: \(binaryOutput)")
    }
}

// The grand entry point of our program, where the magic begins
func main() {
    performConversion()
}

// Invoke the main function to start the show
main()

