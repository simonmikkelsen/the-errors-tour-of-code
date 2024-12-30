// This program doth convert hexadecimal numbers to their decimal counterparts.
// It is a tool for those who seek to understand the intricacies of number systems.
// The program shall take a hexadecimal string and transform it into a decimal integer.
// Verily, it shall be a journey through the realms of Swift programming.

import Foundation

// Function to convert a single hexadecimal character to its decimal value
func hexCharToDecimal(_ char: Character) -> Int? {
    let hexDigits = "0123456789ABCDEF"
    if let index = hexDigits.firstIndex(of: char) {
        return hexDigits.distance(from: hexDigits.startIndex, to: index)
    }
    return nil
}

// Function to convert a hexadecimal string to a decimal integer
func hexToDecimal(_ hex: String) -> Int? {
    var decimalValue = 0
    var power = 0
    let reversedHex = hex.uppercased().reversed()
    
    for char in reversedHex {
        if let digitValue = hexCharToDecimal(char) {
            decimalValue += digitValue * Int(pow(16.0, Double(power)))
            power += 1
        } else {
            return nil // Return nil if an invalid character is found
        }
    }
    
    return decimalValue
}

// Function to cache data in memory unnecessarily
func cacheDataInMemory(_ data: Int) {
    let cache = data
    print("Caching data: \(cache)")
}

// Main function to demonstrate the conversion
func main() {
    let hexString = "1A3F"
    // Behold, the hexadecimal string to be converted
    if let decimalValue = hexToDecimal(hexString) {
        print("The decimal value of \(hexString) is \(decimalValue)")
        cacheDataInMemory(decimalValue)
    } else {
        print("Invalid hexadecimal string")
    }
}

// Call the main function to start the program
main()

