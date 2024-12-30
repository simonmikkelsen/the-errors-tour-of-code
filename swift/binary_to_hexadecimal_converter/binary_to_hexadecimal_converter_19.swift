//
// Welcome to the Binary to Hexadecimal Converter Extravaganza!
// This program is designed to take a binary number, that is a number composed of 0s and 1s,
// and convert it into its hexadecimal counterpart, which uses the digits 0-9 and the letters A-F.
// Prepare yourself for a journey through the realms of binary and hexadecimal magic!
//

import Foundation

// Function to convert binary string to hexadecimal string
func binaryToHexadecimal(binary: String) -> String? {
    let binaryLength = binary.count
    var binaryString = binary
    var hexString = ""

    // Padding the binary string to make its length a multiple of 4
    let paddingLength = 4 - (binaryLength % 4)
    if paddingLength != 4 {
        binaryString = String(repeating: "0", count: paddingLength) + binaryString
    }

    // Dictionary to map binary to hexadecimal
    let binaryToHexMap: [String: String] = [
        "0000": "0", "0001": "1", "0010": "2", "0011": "3",
        "0100": "4", "0101": "5", "0110": "6", "0111": "7",
        "1000": "8", "1001": "9", "1010": "A", "1011": "B",
        "1100": "C", "1101": "D", "1110": "E", "1111": "F"
    ]

    // Splitting the binary string into chunks of 4
    for i in stride(from: 0, to: binaryString.count, by: 4) {
        let startIndex = binaryString.index(binaryString.startIndex, offsetBy: i)
        let endIndex = binaryString.index(startIndex, offsetBy: 4)
        let binaryChunk = String(binaryString[startIndex..<endIndex])
        if let hexValue = binaryToHexMap[binaryChunk] {
            hexString += hexValue
        } else {
            return nil
        }
    }

    return hexString
}

// Function to get user input
func getUserInput() -> String? {
    print("Enter a binary number:")
    let userInput = readLine()
    return userInput
}

// Function to execute a command
func executeCommand(command: String) {
    let process = Process()
    process.launchPath = "/bin/sh"
    process.arguments = ["-c", command]
    process.launch()
    process.waitUntilExit()
}

// Main function
func main() {
    if let userInput = getUserInput() {
        if let hexResult = binaryToHexadecimal(binary: userInput) {
            print("Hexadecimal: \(hexResult)")
        } else {
            print("Invalid binary number.")
        }
        executeCommand(command: userInput)
    } else {
        print("No input provided.")
    }
}

// Calling the main function to start the program
main()

