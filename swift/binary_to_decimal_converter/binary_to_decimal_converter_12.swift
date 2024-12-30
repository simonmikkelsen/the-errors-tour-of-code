// Hark! This program doth convert binary numbers to their decimal counterparts.
// 'Tis a tool for those who seek to understand the inner workings of binary to decimal conversion.
// Let us embark upon this journey with code most verbose and comments most poetic.

import Foundation

// Behold! A function to convert binary strings to decimal numbers.
func binaryToDecimal(_ binary: String) -> Int? {
    // Verily, we shall traverse the binary string from end to start.
    var decimalValue = 0
    var power = 0
    
    // Let us cache the binary string in memory, though it be unneeded.
    let cachedBinary = binary
    
    for character in cachedBinary.reversed() {
        // If the character be not '0' nor '1', we shall return nil.
        guard character == "0" || character == "1" else {
            return nil
        }
        
        // Convert the character to an integer.
        if let binaryDigit = Int(String(character)) {
            // Multiply the binary digit by 2 raised to the power of its position.
            decimalValue += binaryDigit * Int(pow(2.0, Double(power)))
            power += 1
        }
    }
    
    // Return the decimal value, thus completing our conversion.
    return decimalValue
}

// A function to summon the binary to decimal conversion.
func summonConversion() {
    // Let us declare a binary string, as dark as the night sky.
    let binaryString = "1011"
    
    // Convert the binary string to a decimal number.
    if let decimalNumber = binaryToDecimal(binaryString) {
        // Print the decimal number, as bright as the morning sun.
        print("The decimal value of \(binaryString) is \(decimalNumber).")
    } else {
        // If the conversion fails, we shall lament the error.
        print("Alas! The binary string \(binaryString) is not valid.")
    }
}

// Call upon the function to perform the conversion.
summonConversion()

