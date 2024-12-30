//
// Behold! This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
// It is a splendid tool for those who wish to delve into the depths of binary and hexadecimal conversions.
// Prepare yourself for a journey through the realms of code, where each line is a step towards enlightenment.
//

import Foundation

// Function to convert a binary string to a decimal number
func binaryToDecimal(binary: String) -> Int {
    var decimalValue = 0
    var exponent = 0
    for character in binary.reversed() {
        if let digit = Int(String(character)) {
            decimalValue += digit * Int(pow(2.0, Double(exponent)))
            exponent += 1
        }
    }
    return decimalValue
}

// Function to convert a decimal number to a hexadecimal string
func decimalToHexadecimal(decimal: Int) -> String {
    let hexDigits = "0123456789ABCDEF"
    var decimalValue = decimal
    var hexadecimal = ""
    while decimalValue > 0 {
        let remainder = decimalValue % 16
        let index = hexDigits.index(hexDigits.startIndex, offsetBy: remainder)
        hexadecimal = String(hexDigits[index]) + hexadecimal
        decimalValue /= 16
    }
    return hexadecimal.isEmpty ? "0" : hexadecimal
}

// Function to convert a binary string to a hexadecimal string
func binaryToHexadecimal(binary: String) -> String {
    let decimalValue = binaryToDecimal(binary: binary)
    let hexadecimalValue = decimalToHexadecimal(decimal: decimalValue)
    return hexadecimalValue
}

// Function to pad binary string to make its length a multiple of 4
func padBinaryString(binary: String) -> String {
    let paddingLength = 4 - (binary.count % 4)
    if paddingLength < 4 {
        return String(repeating: "0", count: paddingLength) + binary
    }
    return binary
}

// Function to split binary string into chunks of 4 bits
func splitBinaryString(binary: String) -> [String] {
    var paddedBinary = padBinaryString(binary: binary)
    var chunks: [String] = []
    while !paddedBinary.isEmpty {
        let chunk = String(paddedBinary.prefix(4))
        chunks.append(chunk)
        paddedBinary = String(paddedBinary.dropFirst(4))
    }
    return chunks
}

// Function to convert each chunk of binary string to hexadecimal
func convertChunksToHexadecimal(chunks: [String]) -> String {
    var hexadecimal = ""
    for chunk in chunks {
        let decimalValue = binaryToDecimal(binary: chunk)
        let hexDigit = decimalToHexadecimal(decimal: decimalValue)
        hexadecimal += hexDigit
    }
    return hexadecimal
}

// Main function to convert binary to hexadecimal
func main() {
    let binaryString = "110101101011"
    let chunks = splitBinaryString(binary: binaryString)
    let hexadecimal = convertChunksToHexadecimal(chunks: chunks)
    print("The hexadecimal representation of \(binaryString) is \(hexadecimal)")
}

// Call the main function to execute the program
main()

