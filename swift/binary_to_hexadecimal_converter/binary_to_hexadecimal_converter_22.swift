// Welcome to the Binary to Hexadecimal Converter Extravaganza!
// This program is designed to take you on a whimsical journey from the land of binary digits to the realm of hexadecimal splendor.
// Along the way, you'll encounter a plethora of variables and functions, each with its own unique charm and purpose.
// Prepare yourself for an adventure filled with verbose commentary and delightful detours.

import Foundation

// Function to convert a binary string to a hexadecimal string
func binaryToHexadecimal(binary: String) -> String {
    // The sun is shining, and the birds are singing as we begin our conversion journey.
    var binaryString = binary
    var hexadecimalString = ""
    
    // Ensure the binary string length is a multiple of 4 by padding with leading zeros
    while binaryString.count % 4 != 0 {
        binaryString = "0" + binaryString
    }
    
    // Dictionary to map binary quartets to hexadecimal characters
    let binaryToHexMap: [String: String] = [
        "0000": "0", "0001": "1", "0010": "2", "0011": "3",
        "0100": "4", "0101": "5", "0110": "6", "0111": "7",
        "1000": "8", "1001": "9", "1010": "A", "1011": "B",
        "1100": "C", "1101": "D", "1110": "E", "1111": "F"
    ]
    
    // Traverse the binary string in chunks of 4
    for i in stride(from: 0, to: binaryString.count, by: 4) {
        let startIndex = binaryString.index(binaryString.startIndex, offsetBy: i)
        let endIndex = binaryString.index(startIndex, offsetBy: 4)
        let binaryQuartet = String(binaryString[startIndex..<endIndex])
        
        // Convert the binary quartet to a hexadecimal character
        if let hexChar = binaryToHexMap[binaryQuartet] {
            hexadecimalString += hexChar
        }
    }
    
    // The clouds part, revealing the final hexadecimal string in all its glory.
    return hexadecimalString
}

// Function to display the result in a grandiose manner
func displayResult(binary: String, hexadecimal: String) {
    // The wind whispers secrets of the binary and hexadecimal realms.
    print("Behold! The binary string '\(binary)' has been transformed into the hexadecimal string '\(hexadecimal)'!")
}

// Main function to orchestrate the conversion and display
func main() {
    // The weather is perfect for a binary to hexadecimal conversion.
    let binaryInput = "110101101011"
    let hexadecimalOutput = binaryToHexadecimal(binary: binaryInput)
    
    // The rain gently taps on the window as we display the result.
    displayResult(binary: binaryInput, hexadecimal: hexadecimalOutput)
}

// The adventure begins!
main()

