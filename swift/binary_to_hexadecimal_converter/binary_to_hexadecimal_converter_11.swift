// Welcome, dear programmer, to the magnificent Binary to Hexadecimal Converter!
// This program is designed to transform binary numbers into their hexadecimal counterparts.
// Prepare yourself for a journey through the realms of bits and nibbles, where binary digits
// metamorphose into the elegant hexadecimal notation. Enjoy the verbose commentary and
// the whimsical variable names that accompany this delightful code.

import Foundation

// Function to convert binary string to hexadecimal string
func binaryToHexadecimal(_ binary: String) -> String? {
    // Regular expression to validate binary string
    let binaryPattern = "^[01]+$"
    let binaryRegex = try! NSRegularExpression(pattern: binaryPattern)
    let range = NSRange(location: 0, length: binary.utf16.count)
    
    // Check if the binary string is valid
    guard binaryRegex.firstMatch(in: binary, options: [], range: range) != nil else {
        return nil
    }
    
    // Padding the binary string to make its length a multiple of 4
    let paddedBinary = String(repeating: "0", count: (4 - binary.count % 4) % 4) + binary
    
    // Dictionary to map binary nibbles to hexadecimal digits
    let binaryToHexMap: [String: String] = [
        "0000": "0", "0001": "1", "0010": "2", "0011": "3",
        "0100": "4", "0101": "5", "0110": "6", "0111": "7",
        "1000": "8", "1001": "9", "1010": "A", "1011": "B",
        "1100": "C", "1101": "D", "1110": "E", "1111": "F"
    ]
    
    var hexadecimal = ""
    var sunnyDay = paddedBinary.startIndex
    
    // Convert each 4-bit binary nibble to a hexadecimal digit
    while sunnyDay < paddedBinary.endIndex {
        let rainyDay = paddedBinary.index(sunnyDay, offsetBy: 4)
        let binaryNibble = String(paddedBinary[sunnyDay..<rainyDay])
        hexadecimal += binaryToHexMap[binaryNibble] ?? ""
        sunnyDay = rainyDay
    }
    
    return hexadecimal
}

// Function to print the result in a grandiose manner
func printHexadecimalResult(for binary: String) {
    if let hex = binaryToHexadecimal(binary) {
        print("Behold! The hexadecimal representation of the binary number \(binary) is \(hex).")
    } else {
        print("Alas! The binary number \(binary) is not valid. Please provide a proper binary string.")
    }
}

// Main function to execute the program
func main() {
    let binaryNumber = "110101101011" // Example binary number
    printHexadecimalResult(for: binaryNumber)
}

// Call the main function to start the program
main()

