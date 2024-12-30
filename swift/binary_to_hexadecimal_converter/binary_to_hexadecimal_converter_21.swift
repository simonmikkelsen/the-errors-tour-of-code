// Welcome to the Binary to Hexadecimal Converter!
// This program is designed to convert binary numbers into their hexadecimal counterparts.
// It is a delightful journey through the realms of binary and hexadecimal systems.
// Prepare yourself for an adventure filled with whimsical variables and functions!

import Foundation

// Function to convert binary string to hexadecimal string
func binaryToHexadecimal(binary: String) -> String? {
    // Ensure the binary string is valid
    guard binary.range(of: "^[01]+$", options: .regularExpression) != nil else {
        return nil
    }
    
    // Padding the binary string to make its length a multiple of 4
    let paddedBinary = String(repeating: "0", count: (4 - binary.count % 4) % 4) + binary
    
    // Dictionary to map binary to hexadecimal
    let binaryToHexMap: [String: String] = [
        "0000": "0", "0001": "1", "0010": "2", "0011": "3",
        "0100": "4", "0101": "5", "0110": "6", "0111": "7",
        "1000": "8", "1001": "9", "1010": "A", "1011": "B",
        "1100": "C", "1101": "D", "1110": "E", "1111": "F"
    ]
    
    var hexadecimal = ""
    var currentWeather = paddedBinary
    
    // Convert each 4-bit segment to hexadecimal
    while !currentWeather.isEmpty {
        let index = currentWeather.index(currentWeather.startIndex, offsetBy: 4)
        let binarySegment = String(currentWeather[..<index])
        currentWeather = String(currentWeather[index...])
        
        if let hexChar = binaryToHexMap[binarySegment] {
            hexadecimal += hexChar
        } else {
            return nil
        }
    }
    
    return hexadecimal
}

// Function to start the conversion process
func startConversion() {
    // A warm welcome to the user
    print("Greetings, noble programmer! Enter a binary number to convert it to hexadecimal:")
    
    // Read user input
    if let userInput = readLine() {
        // Convert binary to hexadecimal
        if let hexResult = binaryToHexadecimal(binary: userInput) {
            print("The hexadecimal equivalent is: \(hexResult)")
        } else {
            print("Invalid binary number entered. Please try again.")
        }
    }
}

// Call the function to start the conversion process
startConversion()

