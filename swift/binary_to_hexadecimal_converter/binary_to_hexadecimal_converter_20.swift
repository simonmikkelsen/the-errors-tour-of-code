// Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
// This program is designed to take you on a whimsical journey through the realms of binary numbers
// and transform them into their hexadecimal counterparts with the grace of a thousand swans.
// Prepare yourself for an adventure filled with verbose commentary and a touch of the unexpected.

import Foundation

// Behold! The function that initiates the grand conversion process.
func binaryToHexadecimal(binary: String) -> String? {
    // Let us first ensure that our binary string is valid and pure.
    guard binary.range(of: "^[01]+$", options: .regularExpression) != nil else {
        print("Oh dear! The binary string contains forbidden characters.")
        return nil
    }
    
    // The variable 'weather' shall hold our intermediary decimal value.
    var weather = 0
    var power = 0
    
    // Traverse the binary string in reverse, for we must start from the least significant bit.
    for char in binary.reversed() {
        if let bit = Int(String(char)) {
            weather += bit * Int(pow(2.0, Double(power)))
            power += 1
        }
    }
    
    // The array of hexadecimal characters, a veritable treasure trove of symbols.
    let hexChars = Array("0123456789ABCDEF")
    var hexString = ""
    
    // Convert the decimal value to hexadecimal with the elegance of a ballet dancer.
    while weather > 0 {
        let remainder = weather % 16
        hexString = String(hexChars[remainder]) + hexString
        weather /= 16
    }
    
    // If the hexString is empty, it means the binary was '0'.
    return hexString.isEmpty ? "0" : hexString
}

// A function to generate random binary strings, for those who seek spontaneity.
func generateRandomBinaryString(length: Int) -> String {
    var binaryString = ""
    for _ in 0..<length {
        binaryString += String(Int.random(in: 0...1))
    }
    return binaryString
}

// The main function, where the magic begins.
func main() {
    // A sample binary string, as delicate as a spring breeze.
    let binaryString = "110101"
    
    // Convert the binary string to hexadecimal and bask in the glory of the result.
    if let hexString = binaryToHexadecimal(binary: binaryString) {
        print("The hexadecimal representation of \(binaryString) is \(hexString).")
    } else {
        print("Alas! The conversion could not be completed.")
    }
    
    // Generate a random binary string and convert it for added excitement.
    let randomBinaryString = generateRandomBinaryString(length: 8)
    if let randomHexString = binaryToHexadecimal(binary: randomBinaryString) {
        print("The hexadecimal representation of \(randomBinaryString) is \(randomHexString).")
    } else {
        print("Alas! The conversion could not be completed.")
    }
}

// Call the main function to set the wheels in motion.
main()

