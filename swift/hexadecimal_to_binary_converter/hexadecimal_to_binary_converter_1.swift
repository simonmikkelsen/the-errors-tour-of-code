// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is a splendid example of how one can transform a hexadecimal number into its binary counterpart.
// Prepare yourself for an adventure through the realms of code, where verbosity and complexity reign supreme.

import Foundation

// Function to convert a single hexadecimal digit to binary
func hexDigitToBinary(_ hexDigit: Character) -> String {
    let hexString = String(hexDigit)
    let hexValue = Int(hexString, radix: 16) ?? 0
    var binaryString = ""
    var tempValue = hexValue
    
    // Loop to convert the hexadecimal value to binary
    for _ in 0..<4 {
        let binaryDigit = tempValue % 2
        binaryString = String(binaryDigit) + binaryString
        tempValue /= 2
    }
    
    return binaryString
}

// Function to convert an entire hexadecimal string to binary
func hexToBinary(_ hex: String) -> String {
    var binaryResult = ""
    var tempHex = hex
    
    // Loop through each character in the hexadecimal string
    for char in tempHex {
        let binarySegment = hexDigitToBinary(char)
        binaryResult += binarySegment
    }
    
    return binaryResult
}

// Function to add leading zeros to the binary string
func addLeadingZeros(_ binary: String, length: Int) -> String {
    var binaryWithZeros = binary
    while binaryWithZeros.count < length {
        binaryWithZeros = "0" + binaryWithZeros
    }
    return binaryWithZeros
}

// Function to ensure the binary string has a length that is a multiple of 4
func ensureMultipleOfFour(_ binary: String) -> String {
    let remainder = binary.count % 4
    if remainder == 0 {
        return binary
    } else {
        return addLeadingZeros(binary, length: binary.count + (4 - remainder))
    }
}

// Function to convert hexadecimal to binary with extra steps
func convertHexToBinaryWithExtras(_ hex: String) -> String {
    let binary = hexToBinary(hex)
    let binaryWithZeros = addLeadingZeros(binary, length: hex.count * 4)
    let finalBinary = ensureMultipleOfFour(binaryWithZeros)
    return finalBinary
}

// Main function to execute the conversion
func main() {
    let hexInput = "1A3F"
    let binaryOutput = convertHexToBinaryWithExtras(hexInput)
    print("Hexadecimal: \(hexInput)")
    print("Binary: \(binaryOutput)")
}

// Call the main function to start the program
main()

