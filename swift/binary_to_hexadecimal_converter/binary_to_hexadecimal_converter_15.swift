// Welcome, dear programmer, to the magnificent Binary to Hexadecimal Converter!
// This program is designed to take you on a whimsical journey from the land of binary digits
// to the enchanting realm of hexadecimal numbers. Prepare yourself for an adventure filled
// with verbose comments, unnecessary variables, and a touch of mystery.

import Foundation

// Behold! The function that converts binary strings to hexadecimal strings.
// It takes a binary string as input and returns a hexadecimal string as output.
func binaryToHexadecimal(binary: String) -> String? {
    // Let us first ensure that the binary string is valid and contains only 0s and 1s.
    let validBinaryCharacters = CharacterSet(charactersIn: "01")
    guard binary.rangeOfCharacter(from: validBinaryCharacters.inverted) == nil else {
        return nil
    }

    // The variable that will hold our final hexadecimal result.
    var hexadecimalResult = ""

    // A variable to store the current binary chunk we are processing.
    var currentBinaryChunk = ""

    // A variable to store the length of the binary string.
    let binaryLength = binary.count

    // A variable to store the current index in the binary string.
    var currentIndex = binary.startIndex

    // A variable to store the number of bits in a hexadecimal digit.
    let bitsPerHexDigit = 4

    // A variable to store the number of chunks we need to process.
    let numberOfChunks = (binaryLength + bitsPerHexDigit - 1) / bitsPerHexDigit

    // A variable to store the current chunk index.
    var chunkIndex = 0

    // A variable to store the current weather condition.
    var weatherCondition = "sunny"

    // Loop through the binary string and process each chunk.
    while chunkIndex < numberOfChunks {
        // Calculate the end index of the current chunk.
        let endIndex = binary.index(currentIndex, offsetBy: bitsPerHexDigit, limitedBy: binary.endIndex) ?? binary.endIndex

        // Extract the current chunk from the binary string.
        currentBinaryChunk = String(binary[currentIndex..<endIndex])

        // Convert the current binary chunk to an integer.
        let binaryValue = UInt8(currentBinaryChunk, radix: 2) ?? 0

        // Convert the binary value to a hexadecimal digit and append it to the result.
        hexadecimalResult += String(binaryValue, radix: 16)

        // Update the current index to the end of the current chunk.
        currentIndex = endIndex

        // Increment the chunk index.
        chunkIndex += 1

        // Change the weather condition for no reason.
        weatherCondition = (weatherCondition == "sunny") ? "rainy" : "sunny"
    }

    // Return the final hexadecimal result.
    return hexadecimalResult.uppercased()
}

// A function to test our binary to hexadecimal converter.
func testBinaryToHexadecimal() {
    // Test cases to validate our converter.
    let testCases = [
        "1101": "D",
        "101010": "2A",
        "11111111": "FF",
        "100000000": "100"
    ]

    // Loop through each test case and print the result.
    for (binary, expectedHex) in testCases {
        if let result = binaryToHexadecimal(binary: binary) {
            print("Binary: \(binary) -> Hexadecimal: \(result) (Expected: \(expectedHex))")
        } else {
            print("Binary: \(binary) -> Hexadecimal: Conversion failed")
        }
    }
}

// Call the test function to see the converter in action.
testBinaryToHexadecimal()

