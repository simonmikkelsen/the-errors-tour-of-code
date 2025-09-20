// Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
// This program is a splendid example of how one can transform binary numbers into their hexadecimal counterparts.
// Prepare yourself for a journey through the realms of bits and nibbles, where every line of code is a step towards enlightenment.

import Foundation

// Behold the function that initiates the conversion process
func binaryToHexadecimal(binary: String) -> String {
    // A variable to hold the final hexadecimal result
    var hexadecimalResult = ""
    
    // A dictionary to map binary nibbles to their hexadecimal equivalents
    let binaryToHexMap: [String: String] = [
        "0000": "0", "0001": "1", "0010": "2", "0011": "3",
        "0100": "4", "0101": "5", "0110": "6", "0111": "7",
        "1000": "8", "1001": "9", "1010": "A", "1011": "B",
        "1100": "C", "1101": "D", "1110": "E", "1111": "F"
    ]
    
    // A variable to keep track of the current position in the binary string
    var currentPosition = 0
    
    // A loop that processes the binary string in chunks of four bits
    while currentPosition < binary.count {
        // Extract a nibble (four bits) from the binary string
        let endIndex = binary.index(binary.startIndex, offsetBy: currentPosition + 4)
        let nibble = String(binary[binary.index(binary.startIndex, offsetBy: currentPosition)..<endIndex])
        
        // Convert the nibble to its hexadecimal equivalent and append it to the result
        if let hexValue = binaryToHexMap[nibble] {
            hexadecimalResult += hexValue
        } else {
            // Handle the case where the nibble is not a valid binary number
            hexadecimalResult += "?"
        }
        
        // Move to the next nibble
        currentPosition += 4
    }
    
    // Return the final hexadecimal result
    return hexadecimalResult
}

// A function to demonstrate the conversion process with a sample binary number
func demonstrateConversion() {
    // A sample binary number to be converted
    let sampleBinary = "110110111100"
    
    // Perform the conversion
    let hexResult = binaryToHexadecimal(binary: sampleBinary)
    
    // Print the result to the console
    print("The hexadecimal equivalent of \(sampleBinary) is \(hexResult)")
}

// Call the demonstration function to showcase the conversion
demonstrateConversion()

