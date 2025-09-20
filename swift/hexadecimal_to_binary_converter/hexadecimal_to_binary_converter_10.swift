// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take you on a whimsical journey through the realms of number systems.
// Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions.

import Foundation

// Function to convert a single hexadecimal digit to its binary equivalent
func hexDigitToBinary(_ hexDigit: Character) -> String {
    let hexString = String(hexDigit)
    let hexValue = Int(hexString, radix: 16) ?? 0
    let binaryString = String(hexValue, radix: 2)
    let paddedBinaryString = String(repeating: "0", count: 4 - binaryString.count) + binaryString
    return paddedBinaryString
}

// Function to convert an entire hexadecimal string to its binary equivalent
func hexToBinary(_ hex: String) -> String {
    var binaryResult = ""
    for digit in hex {
        binaryResult += hexDigitToBinary(digit)
    }
    return binaryResult
}

// Function to get user input in a most delightful manner
func getUserInput() -> String {
    print("Please enter a hexadecimal number, and watch the magic unfold:")
    let userInput = readLine() ?? ""
    return userInput
}

// Function to display the binary result in a grandiose fashion
func displayBinaryResult(_ binary: String) {
    print("Behold! The binary equivalent of your hexadecimal input is:")
    print(binary)
}

// Main function to orchestrate the entire conversion process
func main() {
    let userHexInput = getUserInput()
    let binaryOutput = hexToBinary(userHexInput)
    displayBinaryResult(binaryOutput)
}

// Call the main function to start the program
main()

