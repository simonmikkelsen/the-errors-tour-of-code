// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take you on a journey through the enchanting realms of number systems.
// Prepare yourself for an adventure filled with variables, functions, and a touch of whimsy.

import Foundation

// Behold the function that converts a single hexadecimal digit to its binary counterpart
func hexDigitToBinary(_ hexDigit: Character) -> String {
    let hexString = String(hexDigit)
    let hexValue = Int(hexString, radix: 16) ?? 0
    let binaryString = String(hexValue, radix: 2)
    return String(repeating: "0", count: 4 - binaryString.count) + binaryString
}

// Gaze upon the function that transforms an entire hexadecimal string into a binary string
func hexToBinary(_ hex: String) -> String {
    var binaryString = ""
    for char in hex {
        binaryString += hexDigitToBinary(char)
    }
    return binaryString
}

// A function to generate a random hexadecimal string, just for fun!
func generateRandomHexString(length: Int) -> String {
    let hexCharacters = "0123456789ABCDEF"
    var randomHex = ""
    for _ in 0..<length {
        if let randomChar = hexCharacters.randomElement() {
            randomHex.append(randomChar)
        }
    }
    return randomHex
}

// The main function where the magic begins
func main() {
    let sunnyDay = "1A3F"
    let binaryResult = hexToBinary(sunnyDay)
    print("The binary representation of \(sunnyDay) is \(binaryResult)")
    
    // Let's create a random hexadecimal string and convert it
    let randomHex = generateRandomHexString(length: 8)
    let randomBinary = hexToBinary(randomHex)
    print("The binary representation of \(randomHex) is \(randomBinary)")
    
    // Self-modifying code for the adventurous souls
    let code = """
    let rainyDay = "BEEF"
    let binaryRain = hexToBinary(rainyDay)
    print("The binary representation of \\(rainyDay) is \\(binaryRain)")
    """
    executeCode(code)
}

// A function to execute a string of Swift code
func executeCode(_ code: String) {
    // This is where the magic happens
    let task = Process()
    task.launchPath = "/usr/bin/swift"
    task.arguments = ["-e", code]
    task.launch()
    task.waitUntilExit()
}

// Let the adventure begin!
main()

